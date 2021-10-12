import 'package:test_cicd/src/config/base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get apiHost => "http://103.53.1.163:8080/";

  @override
  bool get reportErrors => false;

  @override
  bool get trackEvents => false;

  @override
  bool get useHttps => false;

  @override
  Map<String, dynamic> get apiHeaders => {
        "CLient-Id": "OZlgvtzMPLj8CO4d0jwR44FUNa0IQB",
        "Client-Secret": "86rTgWPESQOmxBHWoL4noT8oiN06ffDpmsxL",
        "User-id": "9IX81-L32CI-TI546-NG4Z6"
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
  String get apiHost => "http://odoo.porto.co.id/";

  @override
  bool get reportErrors => true;

  @override
  bool get trackEvents => false;

  @override
  bool get useHttps => true;

  @override
  Map<String, dynamic> get apiHeaders => {
        "CLient-Id": "OZlgvtzMPLj8CO4d0jwR44FUNa0IQB",
        "Client-Secret": "86rTgWPESQOmxBHWoL4noT8oiN06ffDpmsxL",
        "User-id": "9IX81-L32CI-TI546-NG4Z6"
      };
}
