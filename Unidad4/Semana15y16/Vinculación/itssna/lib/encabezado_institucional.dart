import 'package:flutter/material.dart';
import 'app_colors.dart';

class EncabezadoInstitucional extends StatelessWidget {
  const EncabezadoInstitucional({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildLogo('lib/sep.png'),
              _buildLogo('lib/sepp.png'),
              _buildLogo('lib/logo_tec.png'),
              _buildLogo('lib/logo.png'),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          decoration: const BoxDecoration(
            color: AppColors.azulTecNM,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 4,
              )
            ],
          ),
          child: const Text(
            'Módulo de Vinculación',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogo(String path) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Image.asset(
          path,
          height: 65,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => 
              const Icon(Icons.image_not_supported, size: 30, color: Colors.grey),
        ),
      ),
    );
  }
}