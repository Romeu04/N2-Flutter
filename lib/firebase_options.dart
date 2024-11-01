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
    apiKey: 'AIzaSyAj7b1H1iobfoA7ZV-pkzWWRaLEUP3D1ZE',
    appId: '1:155615666928:web:7d825d031d331d686d1835',
    messagingSenderId: '155615666928',
    projectId: 'n2-flutter-8b693',
    authDomain: 'n2-flutter-8b693.firebaseapp.com',
    storageBucket: 'n2-flutter-8b693.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBt8xUFlYJMRebzi8_TTHq3Fu1kbDXdB6o',
    appId: '1:337829483158:android:df98b1693a0fca507d68b7',
    messagingSenderId: '337829483158',
    projectId: 'n2-flutter-f69e3',
    storageBucket: 'n2-flutter-f69e3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCCrkpUr8aR2S0a1sKlct8shyV3zP3O7VM',
    appId: '1:155615666928:ios:2c47ad8362a140906d1835',
    messagingSenderId: '155615666928',
    projectId: 'n2-flutter-8b693',
    storageBucket: 'n2-flutter-8b693.appspot.com',
    iosBundleId: 'com.example.n2Tassiana',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCCrkpUr8aR2S0a1sKlct8shyV3zP3O7VM',
    appId: '1:155615666928:ios:2c47ad8362a140906d1835',
    messagingSenderId: '155615666928',
    projectId: 'n2-flutter-8b693',
    storageBucket: 'n2-flutter-8b693.appspot.com',
    iosBundleId: 'com.example.n2Tassiana',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAj7b1H1iobfoA7ZV-pkzWWRaLEUP3D1ZE',
    appId: '1:155615666928:web:3da48df5d12815446d1835',
    messagingSenderId: '155615666928',
    projectId: 'n2-flutter-8b693',
    authDomain: 'n2-flutter-8b693.firebaseapp.com',
    storageBucket: 'n2-flutter-8b693.appspot.com',
  );

}