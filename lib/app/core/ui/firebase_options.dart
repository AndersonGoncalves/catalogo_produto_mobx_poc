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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDqUX8xZY1he8dlEIhbrruIYu45A3q3fsc',
    appId: '1:603531068009:web:9bf2e28838a2cd0b93d8f8',
    messagingSenderId: '603531068009',
    projectId: 'catalogo-produto-cdbaf',
    authDomain: 'catalogo-produto-cdbaf.firebaseapp.com',
    databaseURL: 'https://catalogo-produto-cdbaf-default-rtdb.firebaseio.com',
    storageBucket: 'catalogo-produto-cdbaf.firebasestorage.app',
    measurementId: 'G-HH053SSJBT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAbT50obg6CEPcrw_Cf3I0pwmXINpygY9w',
    appId: '1:603531068009:android:483378cf03fc16a793d8f8',
    messagingSenderId: '603531068009',
    projectId: 'catalogo-produto-cdbaf',
    databaseURL: 'https://catalogo-produto-cdbaf-default-rtdb.firebaseio.com',
    storageBucket: 'catalogo-produto-cdbaf.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtgUgm3qXFmt8IZU8Aljr5NJmoDfKgaWM',
    appId: '1:603531068009:ios:ffc7e7fb236fcd0993d8f8',
    messagingSenderId: '603531068009',
    projectId: 'catalogo-produto-cdbaf',
    databaseURL: 'https://catalogo-produto-cdbaf-default-rtdb.firebaseio.com',
    storageBucket: 'catalogo-produto-cdbaf.firebasestorage.app',
    iosClientId: '603531068009-68jrsg7sjra5p3brtrg50srl8br7vkt3.apps.googleusercontent.com',
    iosBundleId: 'br.com.andersongoncalvesflorencio.catalogoProdutoPoc',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDqUX8xZY1he8dlEIhbrruIYu45A3q3fsc',
    appId: '1:603531068009:web:32647cbea2fe5aa093d8f8',
    messagingSenderId: '603531068009',
    projectId: 'catalogo-produto-cdbaf',
    authDomain: 'catalogo-produto-cdbaf.firebaseapp.com',
    databaseURL: 'https://catalogo-produto-cdbaf-default-rtdb.firebaseio.com',
    storageBucket: 'catalogo-produto-cdbaf.firebasestorage.app',
    measurementId: 'G-W4000VWG8Y',
  );

}