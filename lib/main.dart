import 'package:flutter/material.dart';
import 'package:test_cicd/src/config/environment.dart';
import 'src/myapp.dart';
import 'src/injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.devEnv,
  );
  Environment().initConfig(environment);
  await di.init();
  runApp(const MyApp());
}
