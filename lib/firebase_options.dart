// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBhFNTJHDB3q-OlQBKgXH7lfP1PkFYXmr4',
    appId: '1:408649818616:web:e10aa7062b70e5c335760d',
    messagingSenderId: '408649818616',
    projectId: 'laravel-flutter-chat-31c9e',
    authDomain: 'laravel-flutter-chat-31c9e.firebaseapp.com',
    storageBucket: 'laravel-flutter-chat-31c9e.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtdHYiGhbCcMOAX8d9qRvSr2CZ1QX2UUU',
    appId: '1:408649818616:android:b540d2dad4ac722435760d',
    messagingSenderId: '408649818616',
    projectId: 'laravel-flutter-chat-31c9e',
    storageBucket: 'laravel-flutter-chat-31c9e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAvqsCSoef8rUIV8fP4wcp6_jy9MWG86OQ',
    appId: '1:408649818616:ios:5e869a4bbf66f94535760d',
    messagingSenderId: '408649818616',
    projectId: 'laravel-flutter-chat-31c9e',
    storageBucket: 'laravel-flutter-chat-31c9e.firebasestorage.app',
    iosBundleId: 'com.example.trustPayBeta',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAvqsCSoef8rUIV8fP4wcp6_jy9MWG86OQ',
    appId: '1:408649818616:ios:5e869a4bbf66f94535760d',
    messagingSenderId: '408649818616',
    projectId: 'laravel-flutter-chat-31c9e',
    storageBucket: 'laravel-flutter-chat-31c9e.firebasestorage.app',
    iosBundleId: 'com.example.trustPayBeta',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBhFNTJHDB3q-OlQBKgXH7lfP1PkFYXmr4',
    appId: '1:408649818616:web:8a1235b2acd9aacb35760d',
    messagingSenderId: '408649818616',
    projectId: 'laravel-flutter-chat-31c9e',
    authDomain: 'laravel-flutter-chat-31c9e.firebaseapp.com',
    storageBucket: 'laravel-flutter-chat-31c9e.firebasestorage.app',
  );
}
