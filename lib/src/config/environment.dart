import 'package:test_cicd/src/config/base_config.dart';
import 'package:test_cicd/src/config/config.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  static final Environment _singleton = Environment._internal();

  static const String devEnv = 'DEV';
  static const String stagingEnv = 'STAGING';
  static const String productionEnv = 'PROD';

  BaseConfig? config;

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.productionEnv:
        return ProdConfig();
      case Environment.stagingEnv:
        return StagingConfig();
      default:
        return DevConfig();
    }
  }
}
