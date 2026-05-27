import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'encabezado_institucional.dart';
import 'dashboard_screen.dart';
import 'empresas_screen.dart';
import 'reportes_screen.dart';
import 'seguimiento_screen.dart';
import 'admin_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceActual = 0;

  final List<Widget> _pantallas = const [
    DashboardScreen(),
    EmpresasScreen(),
    ReportesScreen(),
    SeguimientoScreen(),
    AdminScreen(),
  ];

  void _cambiarPantalla(int indice) {
    setState(() {
      _indiceActual = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Se eliminó la propiedad appBar para evitar la duplicación del título
      body: SafeArea(
        child: Column(
          children: [
            const EncabezadoInstitucional(), // Este componente ya incluye las imágenes y el título inferior
            Expanded(
              child: IndexedStack(
                index: _indiceActual,
                children: _pantallas,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceActual,
        onTap: _cambiarPantalla,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.azulTecNM,
        unselectedItemColor: AppColors.grisTecNM,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Empresas'),
          BottomNavigationBarItem(icon: Icon(Icons.upload_file), label: 'Reportes'),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label: 'Seguimiento'),
          BottomNavigationBarItem(icon: Icon(Icons.admin_panel_settings), label: 'Admin'),
        ],
      ),
    );
  }
}