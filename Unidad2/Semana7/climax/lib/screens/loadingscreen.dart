import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  Future<bool> _ensureLocationPermission() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      if (!mounted) return false;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Location services are disabled. Please enable them in settings.',
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
            'Location permission denied. Please grant permission to continue.',
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
            'Location permission permanently denied. Please enable it from app settings.',
          ),
        ),
      );
      await Geolocator.openAppSettings();
      return false;
    }

    return true;
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
        accuracy: LocationAccuracy.low,
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
        child: ElevatedButton(
          onPressed: getLocation, // ✅ Simplificado, ya muestra snackbar dentro de getLocation
          child: const Text('Get Location'),
        ),
      ),
    );
  }
}