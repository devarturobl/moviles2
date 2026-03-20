import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  // ✅ Variable para almacenar los datos de la API
  String apiData = '';
  double temperature = 0.0;
  int humidity = 0;
  double indiceUV = 0.0;
  int nubosidad = 0;
  String categoria = "";
  String descripcion = "";
  String icono = "";
  double longitude = 0.0;
  double latitude = 0.0;

  IconData iconoNubosidad(int clouds) {
    if (clouds < 10) return Icons.wb_sunny;
    if (clouds < 40) return Icons.wb_cloudy;
    if (clouds < 70) return Icons.cloud_queue;
    return Icons.cloud;
  }

  String indiceuv(double uvi) {
    if (uvi < 2) return "Bajo, Riesgo mínimo";
    if (uvi < 5) return "Moderado, Protección básica";
    if (uvi < 7) return "Alto, Protección adicional";
    if (uvi < 10) return "Muy alto, Protección intensa";
    return "Extremo, Protección máxima";
  }

  String traducirClima(String desc) {
    Map<String, String> mapa = {
      // Categorías
      "Clear": "Despejado",
      "Clouds": "Nublado",
      "Rain": "Lluvia",
      "Drizzle": "Llovizna",
      "Thunderstorm": "Tormenta",
      "Snow": "Nieve",
      "Mist": "Niebla",
      "Fog": "Niebla",
      "Haze": "Neblina",

      // Descripciones
      "clear sky": "Cielo despejado",
      "few clouds": "Pocas nubes",
      "scattered clouds": "Nubes dispersas",
      "broken clouds": "Nubes fragmentadas",
      "overcast clouds": "Cielo nublado",
      "light rain": "Lluvia ligera",
      "moderate rain": "Lluvia moderada",
      "heavy intensity rain": "Lluvia fuerte",
      "light snow": "Nieve ligera",
      "mist": "Niebla",
    };

    return mapa[desc] ?? desc;
  }

  Future<bool> _ensureLocationPermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!mounted) return false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Los servicios de ubicación fueron desactivados. Actívalos en la configuración.',
          ),
        ),
      );
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied) {
      if (!mounted) return false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Permiso de ubicación denegado. Por favor, concede el permiso para continuar.',
          ),
        ),
      );
      return false;
    }

    if (permission == LocationPermission.deniedForever) {
      if (!mounted) return false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Se Prohibio el uso de la geolocalizacion, valla a ajustes y conceda el permiso',
          ),
        ),
      );
      await Geolocator.openAppSettings();
      return false;
    }

    return true;
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getData(double lat, double lon) async {
    final uri = Uri.https('api.openweathermap.org', '/data/3.0/onecall', {
      'lat': lat.toString(),
      'lon': lon.toString(),
      'exclude': 'hourly,daily',
      'units': 'metric',
      'lang': 'es',
      'appid': '2d6f1db34d02373c1ce9c7e5a07ffcc0',
    });

    debugPrint('Llamando a API: $uri');

    try {
      Response response = await get(uri);
      if (response.statusCode != 200) {
        debugPrint(
          'Error HTTP: ${response.statusCode}, body: ${response.body}',
        );
        return;
      }

      final decoded = jsonDecode(response.body) as Map<String, dynamic>;
      final current = decoded['current'] as Map<String, dynamic>?;
      if (current == null) {
        debugPrint('No hay clave current en la respuesta');
        return;
      }

      setState(() {
        apiData = response.body;
        longitude = (decoded['lon'] as num?)?.toDouble() ?? 0.0;
        latitude = (decoded['lat'] as num?)?.toDouble() ?? 0.0;

        temperature = ((current['temp'] as num?)?.toDouble() ?? 0.0);
        humidity = (current['humidity'] as num?)?.toInt() ?? 0;
        indiceUV = (current['uvi'] as num?)?.toDouble() ?? 0.0;
        nubosidad = (current['clouds'] as num?)?.toInt() ?? 0;

        final weather =
            (current['weather'] as List<dynamic>?)?.firstWhere(
                  (item) => item is Map<String, dynamic>,
                  orElse: () => null,
                )
                as Map<String, dynamic>?;

        categoria = weather?['main']?.toString() ?? 'Desconocido';
        descripcion = weather?['description']?.toString() ?? 'sin descripción';
        icono = weather?['icon']?.toString() ?? '01d';
      });
    } catch (e, st) {
      debugPrint('getData exception: $e\n$st');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al obtener datos del clima: $e')),
      );
    }
  }

  Future<void> getLocation() async {
    debugPrint('getLocation iniciado');

    if (!await _ensureLocationPermission()) {
      debugPrint('Permiso denegado');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permiso de ubicación denegado.')),
      );
      return;
    }

    debugPrint('Permiso concedido, obteniendo posición...');
    Position? position;

    try {
      position =
          await Geolocator.getCurrentPosition(
            locationSettings: const LocationSettings(
              accuracy: LocationAccuracy.best,
              timeLimit: Duration(seconds: 10),
            ),
          ).timeout(
            const Duration(seconds: 15),
            onTimeout: () {
              debugPrint('Tiempo de espera agotado para getCurrentPosition');
              return Future.error(
                Exception('Tiempo de espera agotado al obtener ubicación'),
              );
            },
          );
    } catch (e) {
      debugPrint('No se obtuvo getCurrentPosition: $e');
    }

    if (position == null) {
      debugPrint('Intentando getLastKnownPosition como fallback...');
      try {
        position = await Geolocator.getLastKnownPosition();
      } catch (e) {
        debugPrint('Error getLastKnownPosition: $e');
      }
    }

    if (position == null) {
      debugPrint('No se pudo obtener posición. Verifica permiso/servicio.');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No se pudo obtener ubicación.')),
      );
      return;
    }

    debugPrint(
      'Posición obtenida: ${position.latitude}, ${position.longitude}',
    );
    if (!mounted) return;
    getData(position.latitude, position.longitude);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Location: ${position.latitude}, ${position.longitude}'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Obteniendo ubicación y datos del clima...',
              style: TextStyle(fontSize: 16),
            ),
            Text("Temperatura: ${temperature.toStringAsFixed(1)}°C"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.water_drop, color: Colors.blue),
                SizedBox(width: 8),
                Text("Humedad: $humidity%"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.wb_sunny, color: Colors.orange),
                SizedBox(width: 8),
                Text("Índice UV: ${indiceuv(indiceUV)}"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(iconoNubosidad(nubosidad), color: Colors.grey),
                SizedBox(width: 8),
                Text("Nubosidad: $nubosidad%"),
              ],
            ),
            Text("Categoría: ${traducirClima(categoria)}"),
            Text("Descripción: ${traducirClima(descripcion)}"),
            Image.network("https://openweathermap.org/img/wn/$icono@2x.png"),
          ],
        ),
      ),
    );
  }
}
