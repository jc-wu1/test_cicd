import 'package:test_cicd/src/config/base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get apiHost => "localhost";

  @override
  bool get reportErrors => false;

  @override
  bool get trackEvents => false;

  @override
  bool get useHttps => false;

  @override
  Map<String, dynamic> get apiHeaders => {
        "server": "DEV",
      };
}

class StagingConfig implements BaseConfig {
  @override
  String get apiHost => "staging.example.com";

  @override
  bool get reportErrors => true;

  @override
  bool get trackEvents => false;

  @override
  bool get useHttps => true;

  @override
  Map<String, dynamic> get apiHeaders => {
        "server": "STAGING",
      };
}

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => "prod.example.com";

  @override
  bool get reportErrors => true;

  @override
  bool get trackEvents => false;

  @override
  bool get useHttps => true;

  @override
  Map<String, dynamic> get apiHeaders => {
        "server": "PROD",
      };
}
