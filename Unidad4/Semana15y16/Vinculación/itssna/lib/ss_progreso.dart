import 'package:flutter/material.dart';
import 'app_colors.dart';

class SSProgresoCard extends StatelessWidget {
  final int horasCompletadas;
  final int horasTotales;

  const SSProgresoCard({
    super.key,
    required this.horasCompletadas,
    required this.horasTotales,
  });

  @override
  Widget build(BuildContext context) {
    double porcentaje = horasTotales > 0 ? horasCompletadas / horasTotales : 0.0;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.fondoClaro,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.timer_outlined, color: AppColors.azulTecNM),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Progreso de Horas',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.azulTecNM,
                  ),
                ),
              ),
              Text(
                '${(porcentaje * 100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.verdeGob,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: porcentaje,
              backgroundColor: Colors.grey.shade300,
              valueColor: const AlwaysStoppedAnimation<Color>(AppColors.verdeGob),
              minHeight: 12,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Completadas: $horasCompletadas h',
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
              Text(
                'Meta: $horasTotales h',
                style: const TextStyle(fontSize: 14, color: Colors.black87),
              ),
            ],
          )
        ],
      ),
    );
  }
}