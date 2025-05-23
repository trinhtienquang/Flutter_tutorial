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
    apiKey: 'AIzaSyAh1a1EUwIitCMBvVeryQjLM17tjK0-mUU',
    appId: '1:1007311894049:web:2959399c21aace66ef1560',
    messagingSenderId: '1007311894049',
    projectId: 'flutter-chat-app-29500',
    authDomain: 'flutter-chat-app-29500.firebaseapp.com',
    storageBucket: 'flutter-chat-app-29500.firebasestorage.app',
    measurementId: 'G-QQ9KTBZ3F8',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtck1ssRxk51rh-1y68Hfogqx5rNPxXcQ',
    appId: '1:1007311894049:android:1bc118e6f103b14cef1560',
    messagingSenderId: '1007311894049',
    projectId: 'flutter-chat-app-29500',
    storageBucket: 'flutter-chat-app-29500.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhjoGD3TM_KXlprQ_vuNyLf0rdlYE-77o',
    appId: '1:1007311894049:ios:15807438d908159def1560',
    messagingSenderId: '1007311894049',
    projectId: 'flutter-chat-app-29500',
    storageBucket: 'flutter-chat-app-29500.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhjoGD3TM_KXlprQ_vuNyLf0rdlYE-77o',
    appId: '1:1007311894049:ios:15807438d908159def1560',
    messagingSenderId: '1007311894049',
    projectId: 'flutter-chat-app-29500',
    storageBucket: 'flutter-chat-app-29500.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAh1a1EUwIitCMBvVeryQjLM17tjK0-mUU',
    appId: '1:1007311894049:web:df0be054e9252aeeef1560',
    messagingSenderId: '1007311894049',
    projectId: 'flutter-chat-app-29500',
    authDomain: 'flutter-chat-app-29500.firebaseapp.com',
    storageBucket: 'flutter-chat-app-29500.firebasestorage.app',
    measurementId: 'G-Z37ZDBTHJT',
  );

}