import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_management/firebase_options.dart';

@immutable
final class AppInitialize {
  const AppInitialize._();

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    late Directory documentDir;

    documentDir = await getApplicationDocumentsDirectory();

    Hive.init(documentDir.path);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await Future.wait([
      EasyLocalization.ensureInitialized(),
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
    ]);
  }
}
