import 'package:flutter/material.dart';

class DetalleIndustrialPage extends StatelessWidget {
  const DetalleIndustrialPage({super.key});

  // Color primario institucional (Azul ITSSNA)
  final Color primaryBlue = const Color(0xFF1A237E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA), // Fondo gris muy claro
      appBar: AppBar(
        title: const Text(
          'Ingeniería Industrial',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: primaryBlue,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header con Imagen/Banner (Si lograste configurar el asset)
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: primaryBlue,
                image: const DecorationImage(
                  image: AssetImage('lib/assets/Indrustrial.jpeg'), // Tu imagen
                  fit: BoxFit.cover,
                  opacity: 0.4,
                ),
              ),
              child: const Center(
                child: Text(
                  'SÉ LÍDER, SÉ ITSSNA',
                  style: TextStyle(
                   color: Color.fromARGB(255, 238, 241, 73),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionCard(
                    title: 'FILOSOFÍA INSTITUCIONAL',
                    icon: Icons.auto_stories,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSubSeccion(
                          'MISIÓN',
                          'Formar ingenieros innovadores con actitud humanistas y emprendedora...',
                        ),
                        const Divider(),
                        _buildSubSeccion(
                          'VISIÓN',
                          'Ser de Ajalpan y su Sierra Negra la Institución de Educación Superior Tecnológica...',
                        ),
                        const Divider(),
                        const Text(
                          'VALORES',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const Text(
                          '• Trabajo en equipo • Liderazgo • Alto Desempeño\n• Servicio • Calidad • Sentido Humano',
                        ),
                      ],
                    ),
                  ),

                  _buildSectionCard(
                    title: '¿QUÉ ES LA INGENIERÍA INDUSTRIAL?',
                    icon: Icons.engineering,
                    content: const Text(
                      'Enfocada en el diseño, mejora e implementación de sistemas integrados que involucran personas, materiales, equipos, energía e información...',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, height: 1.4),
                    ),
                  ),

                  _buildSectionCard(
                    title: 'OBJETIVO Y COMPETENCIAS',
                    icon: Icons.assignment_turned_in,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'OBJETIVO GENERAL',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const Text(
                          'Formar profesionales éticos, líderes, creativos y emprendedores...',
                          style: TextStyle(fontSize: 15),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'COMPETENCIAS PROFESIONALES',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const Text(
                          'Capaz de diseñar, analizar, mejorar y gestionar sistemas productivos...',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),

                  _buildSectionCard(
                    title: 'PERFILES',
                    icon: Icons.account_circle,
                    content: Column(
                      children: [
                        _buildExpansionTile(
                          'Perfil de Ingreso',
                          '•Interés por las ciencias físico-matemáticas \n•capacidad de análisis \n• razonamiento lógico...',
                        ),
                        _buildExpansionTile(
                          'Perfil de Egreso',
                          'Profesionista con visión integral\n• preparado para la gestión de calidad\n• logística y seguridad...',
                        ),
                      ],
                    ),
                  ),

                  _buildSectionCard(
                    title: 'ESCENARIOS PROFESIONALES',
                    icon: Icons.business_center,
                    content: const Text(
                      '• Industria manufacturera\n• Sector de servicios\n• Logística y suministros\n• Gestión de proyectos\n• Seguridad e Higiene\n• Emprendimiento',
                      style: TextStyle(fontSize: 15, height: 1.6),
                    ),
                  ),

                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      'ITSSNA - 2024',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // WIDGETS PERSONALIZADOS PARA UN ACABADO PROFESIONAL

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Widget content,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: primaryBlue.withOpacity(0.05),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(icon, size: 20, color: primaryBlue),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    color: primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.all(16), child: content),
        ],
      ),
    );
  }

  Widget _buildSubSeccion(String titulo, String contenido) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13,
              color: Colors.blueGrey,
            ),
          ),
          const SizedBox(height: 4),
          Text(contenido, style: const TextStyle(fontSize: 15, height: 1.3)),
        ],
      ),
    );
  }

  Widget _buildExpansionTile(String titulo, String contenido) {
    return ExpansionTile(
      title: Text(
        titulo,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(contenido, textAlign: TextAlign.justify),
        ),
      ],
    );
  }
}
