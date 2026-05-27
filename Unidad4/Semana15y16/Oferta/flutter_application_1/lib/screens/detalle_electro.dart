import 'package:flutter/material.dart';

class DetalleElectroPage extends StatelessWidget {
  const DetalleElectroPage({super.key});

  // Color azul institucional
  final Color primaryBlue = const Color(0xFF1A237E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        // AppBar con logo pequeño y texto
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(width: 10),
            const Text(
              'Ingeniería en Electromecánica',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
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
              height: 150,
              decoration: BoxDecoration(
                color: primaryBlue,
                image: const DecorationImage(
                  image: AssetImage('lib/assets/electro.jpeg'), // Tu imagen
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
                  // 1. FILOSOFÍA
                  _buildSectionCard(
                    title: 'FILOSOFÍA INSTITUCIONAL',
                    icon: Icons.auto_stories,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSubSeccion(
                          'MISIÓN',
                          'Formar ingenieros innovadores con actitud humanista y emprendedora, mediante la educación integral y personal capacitado, para coadyuvar al desarrollo de su entorno.',
                        ),
                        const Divider(),
                        _buildSubSeccion(
                          'VISIÓN',
                          'Ser de Ajalpan y su Sierra Negra la Institución de Educación Superior Tecnológica, pilar fundamental en el desarrollo industrial, económico y tecnológico del país.',
                        ),
                        const Divider(),
                        const Text(
                          'VALORES',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '• Trabajo en equipo\n• Liderazgo\n• Alto Desempeño\n• Servicio\n• Calidad\n• Sentido Humano',
                          style: TextStyle(height: 1.5),
                        ),
                      ],
                    ),
                  ),

                  // 2. ¿QUÉ ES?
                  _buildSectionCard(
                    title: '¿QUÉ ES LA INGENIERÍA EN ELECTROMECÁNICA?',
                    icon: Icons.engineering,
                    content: const Text(
                      'Es una disciplina que integra conocimientos de mecánica, electricidad y electrónica para diseñar, desarrollar, operar y dar mantenimiento a sistemas y equipos complejos.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, height: 1.4),
                    ),
                  ),

                  // 3. OBJETIVOS
                  _buildSectionCard(
                    title: 'OBJETIVO Y COMPETENCIAS',
                    icon: Icons.assignment_turned_in,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'OBJETIVO GENERAL',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
                        ),
                        const Text(
                          'Formar profesionistas de excelencia con capacidad de:',
                          style: TextStyle(fontSize: 15),
                        ),
                        const Text(
                          '• Analizar y diagnosticar sistemas\n• Diseñar e instalar equipos\n• Innovar procesos electromecánicos\n• Administrar mantenimientos eficientes',
                          style: TextStyle(fontSize: 15, height: 1.6),
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'COMPETENCIAS',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
                        ),
                        const Text(
                          '• Diseño de máquinas y redes de energía\n• Automatización y control industrial\n• Proyectos de energías renovables\n• Robótica y manufactura avanzada',
                          style: TextStyle(fontSize: 15, height: 1.6),
                        ),
                      ],
                    ),
                  ),

                  // 4. PERFILES
                  _buildSectionCard(
                    title: 'PERFILES',
                    icon: Icons.account_circle,
                    content: Column(
                      children: [
                        _buildExpansionTile(
                          'Perfil de Ingreso',
                          '• Bases sólidas en matemáticas y física\n• Capacidad de análisis lógico\n• Interés por la tecnología\n• Habilidad para resolver problemas técnicos\n• Ética y compromiso social',
                        ),
                        _buildExpansionTile(
                          'Perfil de Egreso',
                          '• Diseña sistemas electromecánicos\n• Automatiza procesos industriales\n• Gestiona el uso eficiente de energía\n• Lidera equipos de mantenimiento\n• Domina herramientas de simulación',
                        ),
                      ],
                    ),
                  ),

                  // 5. ESCENARIOS
                  _buildSectionCard(
                    title: 'ESCENARIOS PROFESIONALES',
                    icon: Icons.business_center,
                    content: const Text(
                      '• Industria de la energía y eléctrica\n• Empresas de automatización y robótica\n• Plantas de manufactura y automotriz\n• Construcción de instalaciones especiales\n• Centros de investigación tecnológica',
                      style: TextStyle(fontSize: 15, height: 1.8),
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

  // --- WIDGETS PERSONALIZADOS ---

  Widget _buildSectionCard({required String title, required IconData icon, required Widget content}) {
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
          child: Text(
            contenido,
            textAlign: TextAlign.left,
            style: const TextStyle(height: 1.6),
          ),
        ),
      ],
    );
  }
}