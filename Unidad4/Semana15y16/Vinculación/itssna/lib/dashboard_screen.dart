import 'package:flutter/material.dart';
import 'ss_progreso.dart';
import 'app_colors.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Estado Actual: En Proceso',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.azulTecNM),
          ),
          const SizedBox(height: 8),
          const Text(
            'Empresa Asignada: H. Ayuntamiento de Ajalpan',
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
          const SizedBox(height: 24),
          const Text(
            'Avance de Horas',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const SSProgresoCard(
            horasCompletadas: 150,
            horasTotales: 480,
          ),
        ],
      ),
    );
  }
}