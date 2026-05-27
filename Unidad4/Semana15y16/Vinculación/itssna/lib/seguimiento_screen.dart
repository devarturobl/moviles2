import 'package:flutter/material.dart';
import 'app_colors.dart';

class SeguimientoScreen extends StatelessWidget {
  const SeguimientoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: const [
        Text(
          'Historial de Reportes',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 16),
        ListTile(
          leading: Icon(Icons.check_circle, color: AppColors.verdeGob),
          title: Text('Reporte Mensual 1'),
          subtitle: Text('Aprobado - 80 horas'),
          trailing: Text('Ver'),
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.access_time, color: AppColors.doradoGob),
          title: Text('Reporte Mensual 2'),
          subtitle: Text('En revisión - 70 horas'),
          trailing: Text('Ver'),
        ),
      ],
    );
  }
}