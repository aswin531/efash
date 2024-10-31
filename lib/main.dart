import 'package:efash/core/injector.dart/dependency_injection.dart';
import 'package:efash/myapp.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}
