import 'dart:convert';
import 'package:http/http.dart' as http;
import 'weather_model.dart';

class WeatherService {
  static const String API_KEY = '72e046105de303482829022f9194574e';
  static const String BASE_URL =
      'https://api.openweathermap.org/data/2.5/weather';

  Future<Weather> getWeather(String cityName) async {
    final uri = Uri.parse(
      '$BASE_URL?q=$cityName&appid=$API_KEY&units=metric&lang=es',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return Weather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falló la carga de datos del clima');
    }
  }
}
