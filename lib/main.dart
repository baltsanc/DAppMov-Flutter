import 'package:flutter/material.dart';
import 'weather_model.dart';
import 'weather_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter http-API',
      home: WeatherPage(city: 'Guadalajara'),
    );
  }
}

class WeatherPage extends StatefulWidget {
  final String city;
  const WeatherPage({super.key, required this.city});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService();
  Weather? _weather;
  String _errorMessage = '';

  // Obtener el clima.
  _fetchWeather() async {
    setState(() {
      _weather = null; // Reinicia mientras carga.
      _errorMessage = '';
    });

    try {
      final weather = await _weatherService.getWeather(widget.city);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error: No se pudo obtener el clima de ${widget.city}.';
        print(e);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    // Cargar de datos al iniciar la pantalla.
    _fetchWeather();
  }

  // Ícono según condición climática.
  IconData _getWeatherIcon(String mainCondition) {
    switch (mainCondition.toLowerCase()) {
      case 'clouds':
        return Icons.cloud;
      case 'rain':
        return Icons.water_drop;
      case 'drizzle':
        return Icons.cloudy_snowing;
      case 'thunderstorm':
        return Icons.thunderstorm;
      case 'snow':
        return Icons.ac_unit;
      case 'clear':
        return Icons.wb_sunny;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clima con OpenWeatherMap'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: _weather == null && _errorMessage.isEmpty
            ? const CircularProgressIndicator() // Cargando...
            : _errorMessage.isNotEmpty
            ? Text(
                _errorMessage,
                style: const TextStyle(color: Colors.red, fontSize: 18),
                textAlign: TextAlign.center,
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _weather!.cityName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Ícono del clima.
                  Icon(
                    _getWeatherIcon(_weather!.mainCondition),
                    size: 100,
                    color: Colors.orange,
                  ),
                  const SizedBox(height: 20),
                  // Temperatura.
                  Text(
                    '${_weather!.temperature.toStringAsFixed(1)}°C',
                    style: const TextStyle(fontSize: 48),
                  ),
                  const SizedBox(height: 10),
                  // Condición.
                  Text(
                    _weather!.mainCondition,
                    style: const TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: _fetchWeather,
                    child: const Text('Actualizar Clima'),
                  ),
                ],
              ),
      ),
    );
  }
}
