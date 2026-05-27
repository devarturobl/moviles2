import 'package:flutter/material.dart';

class DetalleLenguasPage extends StatelessWidget {
  const DetalleLenguasPage({super.key});

  // Color principal institucional
  final Color primaryBlue = const Color(0xFF1A237E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      appBar: AppBar(
        title: const Text(
          'Lenguas Extranjeras',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: primaryBlue,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            // BANNER
            Container(
              width: double.infinity,
              height: 200,

              decoration: BoxDecoration(
                color: primaryBlue,
                image: const DecorationImage(
                  image: AssetImage('lib/assets/lengua.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.4,
                ),
              ),

              child: const Center(
                child: Text(
                  'APRENDE NUEVOS IDIOMAS',
                  style: TextStyle(
                   color: Color.fromARGB(255, 238, 241, 73),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),

            // CONTENIDO
            Padding(
              padding: const EdgeInsets.all(16.0),

              child: Column(
                children: [

                  // OFERTA EDUCATIVA
                  _buildSectionCard(
                    title: 'OFERTA EDUCATIVA',
                    icon: Icons.language,

                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                        Text(
                          'Cursos de Lenguas Extranjeras',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),

                        SizedBox(height: 15),

                        Text(
                          'Contamos con una oferta educativa de 6 cursos de lenguas extranjeras impartidos en modalidad semestral, diseñados para desarrollar habilidades de comunicación, comprensión y expresión en diferentes idiomas.',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),

                        SizedBox(height: 25),

                        // OBJETIVO
                        Text(
                          'OBJETIVO',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),

                        SizedBox(height: 10),

                        Text(
                          'Brindar a los estudiantes y al público en general la oportunidad de aprender una lengua extranjera mediante cursos accesibles, dinámicos y de calidad, contribuyendo a su desarrollo académico, profesional y personal.',
                          style: TextStyle(
                            fontSize: 15,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),

                        SizedBox(height: 25),

                        // COSTOS
                        Text(
                          'COSTOS',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey,
                          ),
                        ),

                        SizedBox(height: 15),

                        Row(
                          children: [
                            Icon(
                              Icons.school,
                              color: Colors.indigo,
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: Text(
                                'Cursos semestrales: \$480 MXN',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 12),

                        Row(
                          children: [
                            Icon(
                              Icons.wb_sunny,
                              color: Colors.orange,
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: Text(
                                'Cursos de verano: \$810 MXN',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 12),

                        Row(
                          children: [
                            Icon(
                              Icons.public,
                              color: Colors.green,
                            ),

                            SizedBox(width: 10),

                            Expanded(
                              child: Text(
                                'Público en general: \$1,200 MXN',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // FOOTER
                  const Center(
                    child: Text(
                      'ITSSNA - 2024',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
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

  // CARD PERSONALIZADA
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

          // ENCABEZADO
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 12,
            ),

            decoration: BoxDecoration(
              color: primaryBlue.withOpacity(0.05),

              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),

            child: Row(
              children: [

                Icon(
                  icon,
                  size: 20,
                  color: primaryBlue,
                ),

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

          // CONTENIDO
          Padding(
            padding: const EdgeInsets.all(16),
            child: content,
          ),
        ],
      ),
    );
  }
}