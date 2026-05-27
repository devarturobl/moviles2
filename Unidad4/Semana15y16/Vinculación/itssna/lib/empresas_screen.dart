import 'package:flutter/material.dart';
import 'res_proyecto_card.dart';

class EmpresasScreen extends StatelessWidget {
  const EmpresasScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          'Ofertas de Residencia y Servicio Social',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        ResProyectoCard(
          tituloProyecto: 'Desarrollo de Sistema de Inventario',
          empresa: 'Ayuntamiento de Ajalpan',
          vacantes: 3,
          onPostularse: () {},
        ),
        const SizedBox(height: 12),
        ResProyectoCard(
          tituloProyecto: 'Soporte Técnico y Redes',
          empresa: 'Instituto Tecnológico Superior',
          vacantes: 0,
          onPostularse: () {},
        ),
      ],
    );
  }
}