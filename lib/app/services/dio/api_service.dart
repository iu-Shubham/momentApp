import 'package:dio/dio.dart';
import 'client.dart';
import 'endpoints.dart';

class APIManager {
  ///Post API
  static Future<Response> getcurrentweatherdata(
          {required String latitude, required String longitude}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true)
          .get(Endpoints.lead, queryParameters: {
        'current_weather': 'true',
        'latitude': latitude,
        'longitude': longitude,
        'hourly': 'temperature_2m,windspeed_10m,precipitation,weathercode',
        'daily': 'weathercode,temperature_2m_max,temperature_2m_min',
      });
}
