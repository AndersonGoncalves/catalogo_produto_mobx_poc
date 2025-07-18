import 'app/app_provider.dart';
import 'package:flutter/material.dart';
import 'app/core/ui/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(AppProvider());
}
