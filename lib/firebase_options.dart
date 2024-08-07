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
    apiKey: 'AIzaSyDoR_U61-uSV3LSk6JXlMnZn8oETf0rcxk',
    appId: '1:297744071900:web:a194ad14a3086404408819',
    messagingSenderId: '297744071900',
    projectId: 'companions-f72a5',
    authDomain: 'companions-f72a5.firebaseapp.com',
    storageBucket: 'companions-f72a5.appspot.com',
    measurementId: 'G-4L6D0ZD1X2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDrcg4qnxlzIzyiaiVK-BV8eMQnEZvU75s',
    appId: '1:297744071900:android:a05d17411ee5bede408819',
    messagingSenderId: '297744071900',
    projectId: 'companions-f72a5',
    storageBucket: 'companions-f72a5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCKRWMoOj8VO5_ev2bZ4c7RtK33gZYT_zg',
    appId: '1:297744071900:ios:31f31cdbf404f661408819',
    messagingSenderId: '297744071900',
    projectId: 'companions-f72a5',
    storageBucket: 'companions-f72a5.appspot.com',
    iosBundleId: 'com.example.comp87',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCKRWMoOj8VO5_ev2bZ4c7RtK33gZYT_zg',
    appId: '1:297744071900:ios:3c8540d079621fe3408819',
    messagingSenderId: '297744071900',
    projectId: 'companions-f72a5',
    storageBucket: 'companions-f72a5.appspot.com',
    iosBundleId: 'com.example.comp87.RunnerTests',
  );
}
