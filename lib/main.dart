import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:text_tune/presenter/app.dart';
import 'package:text_tune/remote_config.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await RemoteConfig.initialize();

  runApp(const App());
}
