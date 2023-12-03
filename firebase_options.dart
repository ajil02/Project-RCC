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
    apiKey: 'AIzaSyDkl1luWzfAdYxA-EWAI658QWdSr9Zo3FE',
    appId: '1:175309628251:web:b09b99311cabda0824f07e',
    messagingSenderId: '175309628251',
    projectId: 'final-3fb55',
    authDomain: 'final-3fb55.firebaseapp.com',
    storageBucket: 'final-3fb55.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCTB2aA5gDacjpFjr7lxJY97Qw6thCzsbQ',
    appId: '1:175309628251:android:322a1592c465076024f07e',
    messagingSenderId: '175309628251',
    projectId: 'final-3fb55',
    storageBucket: 'final-3fb55.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLcA6t_DXuQK5EjyMC7K2choTNCPZMLUg',
    appId: '1:175309628251:ios:678065866f07e9d224f07e',
    messagingSenderId: '175309628251',
    projectId: 'final-3fb55',
    storageBucket: 'final-3fb55.appspot.com',
    iosBundleId: 'com.example.project',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLcA6t_DXuQK5EjyMC7K2choTNCPZMLUg',
    appId: '1:175309628251:ios:d8bcdfe0df8673b024f07e',
    messagingSenderId: '175309628251',
    projectId: 'final-3fb55',
    storageBucket: 'final-3fb55.appspot.com',
    iosBundleId: 'com.example.project.RunnerTests',
  );
}
