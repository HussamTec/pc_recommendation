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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyC8YYAGZXZSk-en4i2ig6FvF9rZrpiUW6s',
    appId: '1:335581703699:web:8d4e058fd6f5f3056f59e6',
    messagingSenderId: '335581703699',
    projectId: 'pc-recommendation',
    authDomain: 'pc-recommendation.firebaseapp.com',
    storageBucket: 'pc-recommendation.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBj-mdudnbdsRN3eAeY3CzkuVbaTIHeh9U',
    appId: '1:335581703699:android:f3ab6d092e69034a6f59e6',
    messagingSenderId: '335581703699',
    projectId: 'pc-recommendation',
    storageBucket: 'pc-recommendation.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAAmB-oWc2V-ZqQUODzxc6-OxikLPoYIPw',
    appId: '1:335581703699:ios:5ec96aa4bc19883e6f59e6',
    messagingSenderId: '335581703699',
    projectId: 'pc-recommendation',
    storageBucket: 'pc-recommendation.appspot.com',
    iosBundleId: 'com.asaadsharaby.pcRecommendation',
  );
}