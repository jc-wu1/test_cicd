abstract class BaseConfig {
  String get apiHost;
  bool get useHttps;
  bool get trackEvents;
  bool get reportErrors;
  Map<String, dynamic> get apiHeaders;
}
