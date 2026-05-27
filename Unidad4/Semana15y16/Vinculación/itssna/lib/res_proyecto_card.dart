import 'package:flutter/material.dart';
import 'app_colors.dart';

class ResProyectoCard extends StatelessWidget {
  final String tituloProyecto;
  final String empresa;
  final int vacantes;
  final VoidCallback onPostularse;

  const ResProyectoCard({
    super.key,
    required this.tituloProyecto,
    required this.empresa,
    required this.vacantes,
    required this.onPostularse,
  });

  @override
  Widget build(BuildContext context) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.azulTecNM.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.business_center_outlined, color: AppColors.azulTecNM),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tituloProyecto,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.azulTecNM,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      empresa,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.grisTecNM,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: vacantes > 0 
                      ? AppColors.verdeGob.withOpacity(0.1)
                      : AppColors.guindaGob.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 16,
                      color: vacantes > 0 ? AppColors.verdeGob : AppColors.guindaGob,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Vacantes: $vacantes',
                      style: TextStyle(
                        color: vacantes > 0 ? AppColors.verdeGob : AppColors.guindaGob,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: vacantes > 0 ? onPostularse : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.azulTecNM,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Ver Detalles'),
              ),
            ],
          )
        ],
      ),
    );
  }
}