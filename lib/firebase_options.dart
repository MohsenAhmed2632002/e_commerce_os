// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCw9M_oKgm56lIca82eYUzL8y7k9ai2tGU',
    appId: '1:691536506214:web:f7dba4cc746e5d182e2ca7',
    messagingSenderId: '691536506214',
    projectId: 'ecommerc-og',
    authDomain: 'ecommerc-og.firebaseapp.com',
    storageBucket: 'ecommerc-og.appspot.com',
    measurementId: 'G-GBT37JXNWG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBJgSi1FiyX1cGL-Y2t92PVTCKsgobq-40',
    appId: '1:691536506214:android:92bf7746d93acd952e2ca7',
    messagingSenderId: '691536506214',
    projectId: 'ecommerc-og',
    storageBucket: 'ecommerc-og.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDjswxpBIuvtzfiYB0h64vKE05lLAKWh6k',
    appId: '1:691536506214:ios:e888f5fbd26662ab2e2ca7',
    messagingSenderId: '691536506214',
    projectId: 'ecommerc-og',
    storageBucket: 'ecommerc-og.appspot.com',
    iosBundleId: 'com.example.eCommerceOs',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDjswxpBIuvtzfiYB0h64vKE05lLAKWh6k',
    appId: '1:691536506214:ios:8778a711051f8cc62e2ca7',
    messagingSenderId: '691536506214',
    projectId: 'ecommerc-og',
    storageBucket: 'ecommerc-og.appspot.com',
    iosBundleId: 'com.example.eCommerceOs.RunnerTests',
  );
}
