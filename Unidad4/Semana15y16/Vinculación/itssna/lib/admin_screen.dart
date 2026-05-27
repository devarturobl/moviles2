import 'package:flutter/material.dart';
import 'app_colors.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.all(16.0),
      crossAxisCount: 2,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      children: [
        _buildAdminCard(Icons.fact_check, 'Aprobar Solicitudes'),
        _buildAdminCard(Icons.folder_shared, 'Revisar Reportes'),
        _buildAdminCard(Icons.people, 'Gestionar Alumnos'),
        _buildAdminCard(Icons.domain, 'Gestionar Empresas'),
      ],
    );
  }

  Widget _buildAdminCard(IconData icon, String title) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: AppColors.azulTecNM),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}