import 'package:trust_pay_beta/main/presentation/base/retryable_bloc.dart';
import 'package:trust_pay_beta/main/data/network/error_handler.dart';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart' as firebaseAuth;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trust_pay_beta/main/app/constants.dart';
import 'package:trust_pay_beta/main/data/services/pusher_service.dart';
import 'package:trust_pay_beta/main/domain/entities/user/entities.dart';
import 'package:trust_pay_beta/main/domain/functions/compressor.dart';
import 'package:trust_pay_beta/main/domain/repository/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> with RetryableBloc<AuthEvent, AuthState> {
  final AuthRepository repository;
  AuthBloc(this.repository) : super(const _Initial()) {
    on<AuthEvent>((event, emit) async {

      if(event is Login){
        emit(state.copyWith(status: AuthStatus.loading));
        try {
          (await repository.login(event.email, event.password)).fold(
            (failure) {
              emit(state.copyWith(
                  status: AuthStatus.error,
                  errorMessage: failure.message
              ));
            },
            (entity) {
              //Subscribe to user's channel
              if(entity.user?.id != null) {
                PusherService.instance.subscribeToTopic('user-${entity.user!.id}');
                print('Subscription for user-${entity.user!.id} successful');
              }

              //Firebase auth
              signInWIthFirebase(event.email, event.password);

              //Check if currentUser matches the User stored in Local DB
              //If not then empty local storage
              final user = repository.readCurrentUser();
              if (entity.user?.id != user?.id) {
                repository.clearLocalStorage();
                print('Local Storage Cleared');
              }

              //Set auth state
              repository.setAuthState(true);

              emit(state.copyWith(
                status: AuthStatus.authenticated,
                user: entity.user,
                token: entity.token??''
              ));
            }
          );
        } catch (e) {
          emit(state.copyWith(
            status: AuthStatus.error,
            errorMessage: friendlyErrorMessage(e)
          ));
        }
      }

      if(event is Register){
        emit(state.copyWith(status: AuthStatus.loading));
        final profileImage = await compressImage(event.profileImage);
        try {
          (await repository.register(event.firstName, event.lastName, event.email, event.password, profileImage!)).fold(
              (failure) {
                emit(state.copyWith(
                  status: AuthStatus.error,
                  errorMessage: failure.message
                ));
              },
              (entity) {
                //Subscribe to user's channel
                if(entity.user?.id != null) {
                  PusherService.instance.subscribeToTopic('user-${entity.user!.id}');
                  print('Subscription for user-${entity.user!.id} successful');
                }

                //Firebase auth
                registerWIthFirebase(event.email, event.password);

                //Check if currentUser matches the User stored in Local DB
                //If not then empty local storage
                final user = repository.readCurrentUser();
                if (entity.user?.id != user?.id) {
                  repository.clearLocalStorage();
                  print('Local Storage Cleared');
                }

                //Set auth state
                repository.setAuthState(true);

                emit(state.copyWith(
                    status: AuthStatus.authenticated,
                    user: entity.user,
                    token: entity.token??''
                ));
              }
          );
        } catch (e) {
          emit(state.copyWith(
              status: AuthStatus.error,
              errorMessage: friendlyErrorMessage(e)
          ));
        }
      }

      if(event is Logout) {
        emit(state.copyWith(status: AuthStatus.loading));
        //Remove the access token in the DB
        try {
          await (await repository.logout()).fold(
              (failure) async {
                emit(state.copyWith(
                    status: AuthStatus.error,
                    errorMessage: failure.message
                ));
              },
              (entity) async {
                if(entity == 200) {
                  //Set auth state
                  repository.setAuthState(false);

                  //Unsubscribe
                  PusherService.instance.unsubscribeFromTopic('user-${event.user.id}');

                  //Sign out of Google so the account picker shows again next time
                  try {
                    await GoogleSignIn.instance.signOut();
                  } catch (_) {}

                  emit(state.copyWith(
                      status: AuthStatus.loggedOut,
                  ));
                }
              }
          );
        } catch (e) {
          emit(state.copyWith(
              status: AuthStatus.error,
              errorMessage: friendlyErrorMessage(e)
          ));
        }
      }

      if(event is GoogleLogin) {
        emit(state.copyWith(status: AuthStatus.loading));
        try {
          await _ensureGoogleSignInInitialized();

          if (!GoogleSignIn.instance.supportsAuthenticate()) {
            emit(state.copyWith(
              status: AuthStatus.error,
              errorMessage: 'Google Sign-In is not supported on this platform',
            ));
            return;
          }

          final GoogleSignInAccount googleUser;
          try {
            googleUser = await GoogleSignIn.instance.authenticate();
          } on GoogleSignInException catch (e) {
            print("GoogleSignIn authenticate() failed: code=${e.code} description=${e.description} details=${e.details}");
            // The Android plugin reports some internal Play Services
            // failures (e.g. "[16] Account reauth failed") under the same
            // `canceled` code as a genuine user-dismissed picker. Only treat
            // it as a silent cancel when the description doesn't reveal an
            // underlying system failure.
            final description = e.description ?? '';
            final isRealFailure = description.contains('reauth') || description.contains('failed');
            if (e.code == GoogleSignInExceptionCode.canceled && !isRealFailure) {
              emit(state.copyWith(status: AuthStatus.initial));
              return;
            }
            rethrow;
          }

          final idToken = googleUser.authentication.idToken;
          if (idToken == null) {
            emit(state.copyWith(
              status: AuthStatus.error,
              errorMessage: 'Could not retrieve Google ID token',
            ));
            return;
          }

          await (await repository.loginWithGoogle(idToken)).fold(
            (failure) async {
              emit(state.copyWith(
                status: AuthStatus.error,
                errorMessage: failure.message,
              ));
            },
            (entity) async {
              //Subscribe to user's channel
              if (entity.user?.id != null) {
                PusherService.instance.subscribeToTopic('user-${entity.user!.id}');
              }

              //Sign in to Firebase with the same Google credential.
              //Best-effort: a failure here (e.g. Google provider not yet
              //enabled in Firebase Console) must not block the app's own
              //authenticated state, same as signInWIthFirebase for Login.
              try {
                final credential = firebaseAuth.GoogleAuthProvider.credential(idToken: idToken);
                await firebaseAuth.FirebaseAuth.instance.signInWithCredential(credential);
              } catch (e) {
                print("Firebase Google Sign-In Error: $e");
              }

              //Check if currentUser matches the User stored in Local DB
              //If not then empty local storage
              final user = repository.readCurrentUser();
              if (entity.user?.id != user?.id) {
                repository.clearLocalStorage();
              }

              //Set auth state
              repository.setAuthState(true);

              emit(state.copyWith(
                status: AuthStatus.authenticated,
                user: entity.user,
                token: entity.token ?? '',
              ));
            },
          );
        } catch (e) {
          print("GoogleLogin failed: ${e.runtimeType}: $e");
          emit(state.copyWith(
            status: AuthStatus.error,
            errorMessage: friendlyErrorMessage(e),
          ));
        }
      }

    });
  }

  bool _googleSignInInitialized = false;

  // GoogleSignIn.instance.initialize() must be called exactly once, and
  // awaited, before any other GoogleSignIn method is used.
  Future<void> _ensureGoogleSignInInitialized() async {
    if (_googleSignInInitialized) return;
    await GoogleSignIn.instance.initialize(
      serverClientId: AppConstants.googleServerClientId.isEmpty
          ? null
          : AppConstants.googleServerClientId,
    );
    _googleSignInInitialized = true;
  }
}

Future<firebaseAuth.UserCredential?> registerWIthFirebase(String email, String password) async {
  try {
    return await firebaseAuth.FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print("Registration Error: $e");
    return null;
  }
}

Future<firebaseAuth.UserCredential?> signInWIthFirebase(String email, String password) async {
  try {
    return await firebaseAuth.FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  } catch (e) {
    print("Login Error: $e");
    return null;
  }
}