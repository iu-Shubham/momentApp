class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "https://api.open-meteo.com/v1/";
  static const String lead = "forecast";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 15000;
}
