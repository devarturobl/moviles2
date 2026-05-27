import 'package:flutter/material.dart';

import 'COMUNIDAD/estudiantes.dart';
import 'COMUNIDAD/egresados.dart';
import 'COMUNIDAD/personal_itssna.dart';
import 'COMUNIDAD/cuotas_vigentes.dart';
import 'COMUNIDAD/calendario_escolar.dart';
import 'COMUNIDAD/credencializacion.dart';
import 'COMUNIDAD/titulacion.dart';

void main() {
  runApp(const TecNMApp());
}

class TecNMApp extends StatelessWidget {
  const TecNMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MenuComunidadPage(),
    );
  }
}

class MenuComunidadPage extends StatelessWidget {
  const MenuComunidadPage({super.key});

  final List<Map<String, dynamic>> apartados = const [
    {
      'titulo': 'Estudiantes',
      'icono': Icons.school_rounded,
      'pagina': EstudiantesPage(),
    },
    {
      'titulo': 'Egresados',
      'icono': Icons.workspace_premium_rounded,
      'pagina': EgresadosPage(),
    },
    {
      'titulo': 'Personal ITSSNA',
      'icono': Icons.groups_rounded,
      'pagina': PersonalITSSNAPage(),
    },
    {
      'titulo': 'Cuotas Vigentes',
      'icono': Icons.payments_rounded,
      'pagina': CuotasVigentesPage(),
    },
    {
      'titulo': 'Calendario Escolar',
      'icono': Icons.calendar_month_rounded,
      'pagina': CalendarioEscolarPage(),
    },
    {
      'titulo': 'Credencialización',
      'icono': Icons.badge_rounded,
      'pagina': CredencializacionPage(),
    },
    {
      'titulo': 'Titulación',
      'icono': Icons.school_outlined,
      'pagina': TitulacionPage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(18),
                itemCount: apartados.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  childAspectRatio: .95,
                ),
                itemBuilder: (context, index) {
                  final item = apartados[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => item['pagina'],
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .08),
                            blurRadius: 14,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 35,
                            backgroundColor: const Color(0xFF1B396A),
                            child: Icon(
                              item['icono'],
                              color: Colors.white,
                              size: 36,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            item['titulo'],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Color(0xFF1B396A),
                              fontSize: 17,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 30),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF1B396A),
            Color(0xFF12284C),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(32),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comunidad ITSSNA',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Selecciona el apartado que deseas consultar.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}