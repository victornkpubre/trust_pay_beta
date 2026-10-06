# Implementing Google Sign-In

Current state (as of this guide): `GoogleAuthButton` exists purely as UI
(`lib/components/buttons/google_auth_btn.dart`) and is wired to an empty
`onTap: () {}` in both `auth_view.dart` and `email_auth_view.dart`. There isSS
no `google_sign_in` dependency, no Firebase Console OAuth client
configured for Android, and no `GoogleService-Info.plist` for iOS.

This app has **two auth systems that must both succeed**: your own backend
(`AuthRepository.login`/`register`, called via API) and Firebase Auth (used
in parallel — see `signInWIthFirebase`/`registerWIthFirebase` in
`lib/main/presentation/blocs/auth/auth_bloc.dart`). Google Sign-In has to
feed both, so this guide has a backend step you can't skip.
SA
---

## 0. Decide the backend contract first

Email/password auth today works like this (`auth_bloc.dart`):
1. Call your backend (`repository.login(email, password)`) → get back your
   app's own `Authentication` (user + token).
2. Separately sign in to Firebase with the same email/password
   (`signInWIthFirebase`).

Google Sign-In only gives you a Google ID token — there's no
email/password to replay against your backend. You need your backend to
accept that token instead. Talk to whoever owns the backend and agree on
an endpoint, e.g.:

```
POST /auth/google
Body: { "id_token": "<google_id_token>" }
Response: same shape as /auth/login (user + token)
```

The backend verifies the token against Google's public keys (or the
Firebase Admin SDK, since you're already using Firebase project-side) and
creates/finds the user. Everything below assumes this endpoint exists as
`repository.loginWithGoogle(idToken)` — add it to `AuthRepository` and its
implementation the same way `login`/`register` are implemented.

If you'd rather not touch the backend right now, an alternative is to
treat the **Firebase ID token** as your only source of truth and drop the
custom backend token for Google users — but that's a bigger architectural
change and inconsistent with how the rest of the app works, so it's not
covered here.

---

## 1. Add the package

```yaml
# pubspec.yaml
dependencies:
  google_sign_in: ^6.2.2   # check pub.dev for the latest 6.x
```

```bash
flutter pub get
```

---

## 2. Firebase Console setup

You're on `firebase_auth: ^5.5.1` already, so the Firebase project exists.
The current `android/app/google-services.json` has an **empty
`oauth_client` array** for `com.polarisbank.trust_pay_beta` — no SHA
fingerprint is registered, so Google Sign-In will fail with
`ApiException: 10` (`DEVELOPER_ERROR`) until you fix this.

1. Go to **Firebase Console → Authentication → Sign-in method** → enable
   **Google**.
2. Get your debug SHA-1 (and SHA-256) fingerprint:
   ```bash
   cd android
   ./gradlew signingReport
   ```
   Look for the `debug` variant's SHA1/SHA256. Do this again for your
   **release** keystore before shipping — a separate fingerprint is
   required.
3. In **Firebase Console → Project settings → Your apps → Android app
   (`com.polarisbank.trust_pay_beta`)**, add each SHA fingerprint.
4. Re-download `google-services.json` and replace
   `android/app/google-services.json`. Confirm the `oauth_client` array is
   no longer empty (`node -e "console.log(require('./android/app/google-services.json').client.find(c=>c.client_info.android_client_info.package_name==='com.polarisbank.trust_pay_beta').oauth_client)"`).

   Note: this file currently also contains entries for
   `com.example.flutter_pusher`, `com.example.laravel_flutter_chat`, and
   `com.example.trust_pay_beta` — leftovers from other apps sharing this
   Firebase project. Worth cleaning up in the Firebase Console at some
   point, but not required for this to work.

5. For iOS: in the same Firebase project, add an iOS app with your bundle
   ID (check `ios/Runner.xcodeproj` for the current one), download
   `GoogleService-Info.plist`, and add it to `ios/Runner/` (drag into
   Xcode under the `Runner` target so it's bundled — a plain file copy
   without adding it to the Xcode project won't work).

---

## 3. Android config

`android/app/build.gradle` and `android/settings.gradle` already apply the
`com.google.gms.google-services` plugin — no changes needed there.

`minSdk = 24` (in `android/app/build.gradle`) already satisfies
`google_sign_in`'s minimum (API 21+), so nothing to bump.

---

## 4. iOS config

1. Open `GoogleService-Info.plist`, copy the `REVERSED_CLIENT_ID` value.
2. In `ios/Runner/Info.plist`, add a URL scheme (there's currently no
   `CFBundleURLTypes` entry in this file at all):

```xml
<key>CFBundleURLTypes</key>
<array>
  <dict>
    <key>CFBundleTypeRole</key>
    <string>Editor</string>
    <key>CFBundleURLSchemes</key>
    <array>
      <string>REVERSED_CLIENT_ID_GOES_HERE</string>
    </array>
  </dict>
</array>
```

3. No changes needed in `ios/Runner/AppDelegate.swift` — it already calls
   `GeneratedPluginRegistrant.register(with: self)`, which wires up
   `google_sign_in`'s iOS plugin automatically.

---

## 5. Add the repository method

In `lib/main/domain/repository/repositories.dart`, add to
`AuthRepository`:

```dart
Future<Either<Failure, Authentication>> loginWithGoogle(String idToken);
```

Implement it in the concrete repository (wherever `login`/`register` are
implemented — same file/pattern, hitting the `/auth/google` endpoint from
step 0) and in any test doubles.

---

## 6. Add a bloc event

`lib/main/presentation/blocs/auth/auth_bloc.dart` currently has `Login`,
`Register`, `Logout` events (defined in `auth_event.dart`, a freezed
union). Add a `GoogleLogin` event alongside them:

```dart
// auth_event.dart
const factory AuthEvent.googleLogin() = GoogleLogin;
```

Then in `auth_bloc.dart`, add a handler that mirrors the `Login` block —
sign in to Google, get the ID token, hand it to the backend, then to
Firebase:

```dart
if (event is GoogleLogin) {
  emit(state.copyWith(status: AuthStatus.loading));
  try {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      // user cancelled the picker
      emit(state.copyWith(status: AuthStatus.initial));
      return;
    }

    final googleAuth = await googleUser.authentication;
    final idToken = googleAuth.idToken;
    if (idToken == null) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: 'Could not retrieve Google ID token',
      ));
      return;
    }

    (await repository.loginWithGoogle(idToken)).fold(
      (failure) {
        emit(state.copyWith(
          status: AuthStatus.error,
          errorMessage: failure.message,
        ));
      },
      (entity) async {
        if (entity.user?.id != null) {
          PusherService.instance.subscribeToTopic('user-${entity.user!.id}');
        }

        // Sign in to Firebase with the same Google credential
        final credential = firebaseAuth.GoogleAuthProvider.credential(
          idToken: idToken,
          accessToken: googleAuth.accessToken,
        );
        await firebaseAuth.FirebaseAuth.instance.signInWithCredential(credential);

        final user = repository.readCurrentUser();
        if (entity.user?.id != user?.id) {
          repository.clearLocalStorage();
        }

        repository.setAuthState(true);

        emit(state.copyWith(
          status: AuthStatus.authenticated,
          user: entity.user,
          token: entity.token ?? '',
        ));
      },
    );
  } catch (e) {
    emit(state.copyWith(
      status: AuthStatus.error,
      errorMessage: e.toString(),
    ));
  }
}
```

Add the import at the top of `auth_bloc.dart`:

```dart
import 'package:google_sign_in/google_sign_in.dart';
```

(`firebase_auth` is already imported as `firebaseAuth` in that file.)

---

## 7. Wire up the buttons

`lib/main/presentation/views/authentication/auth_view.dart:46`:

```dart
GoogleAuthButton(onTap: () {
  context.read<AuthBloc>().add(const AuthEvent.googleLogin());
}),
```

`lib/main/presentation/views/authentication/email/email_auth_view.dart:149`:

```dart
GoogleAuthButton(
  title: registering ? "Register with Google " : 'Login with Google',
  onTap: () {
    context.read<AuthBloc>().add(const AuthEvent.googleLogin());
  },
),
```

Both views need a `BlocListener<AuthBloc, AuthState>` (or whatever
existing listener is already handling `Login`/`Register` results) to react
to `AuthStatus.authenticated`/`AuthStatus.error` — check how the existing
`_login` flow in `email_auth_view.dart` navigates/shows errors and reuse
the same listener, since `GoogleLogin` emits the same `AuthState` shape.

---

## 8. Sign out

Wherever `Logout` is dispatched (search for `AuthEvent.logout` /
`Logout()`), also call `GoogleSignIn().signOut()` alongside the existing
Firebase/backend sign-out so a subsequent Google Sign-In doesn't silently
reuse the previous account without showing the account picker:

```dart
if (event is Logout) {
  ...
  await GoogleSignIn().signOut();
  ...
}
```

---

## 9. Test checklist

- [ ] Debug SHA-1 registered in Firebase Console, fresh
      `google-services.json` downloaded and replaced
- [ ] Android: tap Google button → account picker appears → returns to app
      authenticated
- [ ] Android: force-stop app, relaunch, confirm no silent-login issues
      (or that silent sign-in behaves as intended)
- [ ] iOS: `GoogleService-Info.plist` added to Xcode target (not just the
      folder), `CFBundleURLTypes` scheme added, sign-in flow works
- [ ] Backend `/auth/google` endpoint returns the same `Authentication`
      shape as `/auth/login` (existing `.fold()` code expects it)
- [ ] Logout clears Google session (test signing in with a **different**
      Google account right after logout)
- [ ] Release build: release keystore's SHA-1 added to Firebase Console
      before shipping (separate from debug SHA-1)

---

## Common pitfall

`PlatformException(sign_in_failed, ApiException: 10, ...)` on Android
almost always means the SHA-1 fingerprint of the keystore you're building
with isn't registered against the OAuth client in Firebase Console, or
you're using a stale `google-services.json`. Re-run `signingReport`,
double check it matches what's in the console, re-download the JSON.
