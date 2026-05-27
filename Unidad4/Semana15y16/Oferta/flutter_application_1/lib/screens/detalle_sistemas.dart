import 'package:flutter/material.dart';

class DetalleSistemasPage extends StatelessWidget {
  const DetalleSistemasPage({super.key});

  // Color primario institucional (Azul ITSSNA)
  final Color primaryBlue = const Color(0xFF1A237E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Ingeniería en Sistemas Computacionales',
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
            // HEADER
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: primaryBlue,
                image: const DecorationImage(
                  image: AssetImage('lib/assets/sistemas.jpeg'),
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
                  // FILOSOFÍA
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
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '• Trabajo en equipo\n• Liderazgo\n• Alto desempeño\n• Servicio\n• Calidad\n• Sentido humano',
                        ),
                      ],
                    ),
                  ),

                  // ¿QUÉ ES?
                  _buildSectionCard(
                    title: '¿QUÉ ES LA INGENIERÍA EN SISTEMAS COMPUTACIONALES?',
                    icon: Icons.computer,
                    content: const Text(
                      'La Ingeniería en Sistemas Computacionales es una disciplina que estudia los fenómenos reales con el propósito de analizar, modelar y diseñar aplicaciones o herramientas que faciliten el tratamiento de éstos. Utiliza la computadora como principal herramienta para resolver problemas en los sectores público y privado mediante aplicaciones móviles, sitios web, redes, bases de datos y estrategias de seguridad informática.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, height: 1.4),
                    ),
                  ),

                  // OBJETIVO Y COMPETENCIAS
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
                        const SizedBox(height: 5),
                        const Text(
                          '\n•Formar profesionistas líderes con visión estratégica y amplio sentido ético\n•capaces de diseñar desarrollar\n• implementar y administrar tecnología computacional para aportar soluciones innovadoras en beneficio de la sociedad.',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          'COMPETENCIAS PROFESIONALES',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          '\n•Capaz de desarrollar software\n•administrar redes\n• bases de datos\n• inteligencia artificial\n• cloud computing\n• ciberseguridad\n• IoT y big data\n•aplicando metodologías ágiles y soluciones innovadoras para la transformación digital.',
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),

                  // PERFILES
                  _buildSectionCard(
                    title: 'PERFILES',
                    icon: Icons.account_circle,
                    content: Column(
                      children: [
                        _buildExpansionTile(
                          'Perfil de Ingreso',
                          '\n•Conocimientos básicos de computación\n• interés por la tecnología e investigación\n•capacidad para trabajar en equipo\n•creatividad\n•innovación\n•responsabilidad y actitud de servicio.',
                        ),
                        _buildExpansionTile(
                          'Perfil de Egreso',
                          '\n•Capaz de implementar aplicaciones computacionales\n•desarrollar software\n•administrar bases de datos y redes\n•aplicar inteligencia artificial y crear soluciones tecnológicas innovadoras para distintos contextos.',
                        ),
                      ],
                    ),
                  ),

                  // ESCENARIOS
                  _buildSectionCard(
                    title: 'ESCENARIOS PROFESIONALES',
                    icon: Icons.business_center,
                    content: const Text(
                      '• Desarrollo de software\n• Aplicaciones móviles y web\n• Redes y telecomunicaciones\n• Bases de datos\n• Inteligencia Artificial\n• Ciberseguridad\n• Cloud Computing\n• Soporte y mantenimiento\n• Emprendimiento tecnológico',
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

  // WIDGETS PERSONALIZADOS

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
          Text(
            contenido,
            style: const TextStyle(fontSize: 15, height: 1.3),
            textAlign: TextAlign.justify,
          ),
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
