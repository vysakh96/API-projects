import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_store.dart';

class WeatherData {
  Future<Store> getWeatherData(String place) async {
    try {
      final query_parameter = {
        'key': '07e1fb51a83d45618d055057233001',
        'q': place,
      };
      final uri =
          Uri.http('api.weatherapi.com', '/v1/current.json', query_parameter);

      final response = await http.get(uri);

      if (response.statusCode == 200) {
        return Store.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('cannot get weather data');
      }
    } catch (e) {
      rethrow;
    }
  }
}
