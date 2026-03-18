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

  Map<String,String> mapa = {
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
            'Los servicios de ubicación están desactivados. Actívalos en la configuración.',
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
            ' ',
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


  void getData() async{
    Response response = await get(Uri.parse('https://api.openweathermap.org/data/3.0/onecall?lat=18.37326&lon=-97.23484&exclude=hourly,daily&appid=2d6f1db34d02373c1ce9c7e5a07ffcc0'));
    if (response.statusCode == 200) {
      debugPrint('Data received: ${response.body}');
      setState(() {
        apiData = response.body;
      });

      var longitude = jsonDecode(apiData)['lon'];
      var latitude = jsonDecode(apiData)['lat'];
      
      temperature = jsonDecode(apiData)["current"]["temp"];
      temperature = temperature - 273.15; // Convertir de Kelvin a Celsius
      humidity = jsonDecode(apiData)["current"]["humidity"];
      indiceUV = jsonDecode(apiData)["current"]["uvi"]; 
      nubosidad = jsonDecode(apiData)["current"]["clouds"];
      categoria = jsonDecode(apiData)["current"]["weather"][0]["main"]; 
      descripcion = jsonDecode(apiData)["current"]["weather"][0]["description"];
      icono = jsonDecode(apiData)["current"]["weather"][0]["icon"];
    } else {
      debugPrint('Failed to load data: ${response.statusCode}');
    }
  }

  Future<void> getLocation() async {
  debugPrint('getLocation iniciado');

  if (!await _ensureLocationPermission()) {
    debugPrint('Permiso denegado');
    return;
  }

  debugPrint('Permiso concedido, obteniendo posición...');

  try {
    final position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.best,
        timeLimit: Duration(seconds: 10), // ✅ Timeout añadido
      ),
    ).timeout(
      const Duration(seconds: 15), // ✅ Timeout de respaldo
      onTimeout: () {
        throw Exception('Tiempo de espera agotado al obtener ubicación');
      },
    );

    debugPrint('Posición: ${position.latitude}, ${position.longitude}');

    if (!mounted) return;

    getData();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Location: ${position.latitude}, ${position.longitude}'),
      ),
    );
    } catch (e) {
      debugPrint('Error: $e');
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
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
            Image.network("https://openweathermap.org/img/wn/$icono@2x.png",
            ),
          ],
        ),
      ),
    );
  }
}