import 'package:flutter/material.dart';

void main() {
  runApp(const TecNMApp());
}

class TecNMApp extends StatelessWidget {
  const TecNMApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Estudiantes',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B396A)),
      ),
      home: const EstudiantesPage(),
    );
  }
}

class EstudiantesPage extends StatefulWidget {
  const EstudiantesPage({super.key});

  @override
  State<EstudiantesPage> createState() => _EstudiantesPageState();
}

class _EstudiantesPageState extends State<EstudiantesPage> {
  int seleccionado = 0;

  final List<Map<String, dynamic>> datos = [
    {
      'titulo': 'Ser alumno',
      'icono': Icons.person_rounded,
      'color': Color(0xFF1B396A),
      'texto':
          'Eres alumno cuando quedas inscrito en alguna carrera del Instituto. Al inscribirte, formas parte de la comunidad y aceptas cumplir el reglamento.',
      'puntos': [
        'Formas parte de la comunidad escolar.',
        'Debes cumplir el reglamento institucional.',
        'Tienes derechos y obligaciones como estudiante.',
      ],
    },
    {
      'titulo': 'Inscripción',
      'icono': Icons.how_to_reg_rounded,
      'color': Color(0xFF9D2449),
      'texto':
          'La inscripción se realiza en los periodos establecidos por el calendario escolar y requiere entregar documentación oficial.',
      'puntos': [
        'Solicitud de inscripción.',
        'Certificado de bachillerato.',
        'Acta de nacimiento, CURP y comprobante de domicilio.',
        'Certificado médico y pago de inscripción.',
      ],
    },
    {
      'titulo': 'Reinscripción',
      'icono': Icons.assignment_turned_in_rounded,
      'color': Color(0xFFBC955C),
      'texto':
          'Para reinscribirte debes cumplir con la seriación del plan de estudios, entregar solicitud y carga académica autorizada.',
      'puntos': [
        'Solicitud de reinscripción.',
        'Carga académica autorizada.',
        'Pago correspondiente.',
        'Estar dentro del tiempo permitido para terminar la carrera.',
      ],
    },
    {
      'titulo': 'Acreditación',
      'icono': Icons.verified_rounded,
      'color': Color(0xFF1B396A),
      'texto':
          'Para acreditar una asignatura debes aprobar el 100% de las competencias específicas del programa de estudios.',
      'puntos': [
        'Curso ordinario.',
        'Curso de repetición.',
        'Curso especial.',
        'Curso global.',
      ],
    },
    {
      'titulo': 'Permanencia',
      'icono': Icons.timeline_rounded,
      'color': Color(0xFF9D2449),
      'texto':
          'Los alumnos regulares deben concluir su carrera en nueve semestres. Los alumnos irregulares pueden terminar en máximo doce semestres.',
      'puntos': [
        '9 semestres para alumnos regulares.',
        '12 semestres máximo para alumnos irregulares.',
        'Puedes solicitar baja parcial o temporal si lo necesitas.',
      ],
    },
    {
      'titulo': 'Derechos',
      'icono': Icons.favorite_rounded,
      'color': Color(0xFFBC955C),
      'texto':
          'Tienes derecho a recibir educación integral y de calidad, conocer tu plan de estudios, calendario, horarios y ser evaluado conforme a los programas.',
      'puntos': [
        'Recibir educación de calidad.',
        'Conocer horarios, calendario y programas.',
        'Revisión de exámenes y trabajos.',
        'Participar en actividades académicas.',
      ],
    },
    {
      'titulo': 'Obligaciones',
      'icono': Icons.rule_rounded,
      'color': Color(0xFF1B396A),
      'texto':
          'Como estudiante debes cumplir el reglamento, respetar a la comunidad, realizar trámites en tiempo y cuidar las instalaciones.',
      'puntos': [
        'Cumplir el reglamento.',
        'Respetar a docentes, alumnos y personal.',
        'Cuidar instalaciones y equipo.',
        'Realizar trámites escolares en tiempo.',
      ],
    },
    {
      'titulo': 'Bajas',
      'icono': Icons.warning_rounded,
      'color': Color(0xFF9D2449),
      'texto':
          'El reglamento contempla baja parcial, baja temporal y baja definitiva, dependiendo de la situación académica del alumno.',
      'puntos': [
        'Baja parcial de algunas materias.',
        'Baja temporal de todas las materias.',
        'Baja definitiva por causas académicas o reglamentarias.',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final item = datos[seleccionado];

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(18),
                children: [
                  _mensajePrincipal(),
                  const SizedBox(height: 18),
                  _menuHorizontal(),
                  const SizedBox(height: 18),
                  _tarjetaDetalle(item),
                  const SizedBox(height: 18),
                  _puntosImportantes(item),
                ],
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
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 26),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1B396A), Color(0xFF12284C)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(32)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Estudiantes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 31,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Información esencial del reglamento estudiantil.',
            style: TextStyle(color: Colors.white70, fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget _mensajePrincipal() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF9D2449),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.10),
            blurRadius: 14,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: const Row(
        children: [
          Icon(Icons.info_rounded, color: Colors.white, size: 36),
          SizedBox(width: 14),
          Expanded(
            child: Text(
              'Consulta de forma rápida lo más importante que debes conocer como estudiante del Instituto.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 1.35,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuHorizontal() {
    return SizedBox(
      height: 105,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: datos.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final item = datos[index];
          final activo = seleccionado == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                seleccionado = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 118,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: activo ? item['color'] : Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: activo ? item['color'] : Colors.grey.shade300,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.07),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item['icono'],
                    color: activo ? Colors.white : item['color'],
                    size: 30,
                  ),
                  const SizedBox(height: 9),
                  Text(
                    item['titulo'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: activo ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w800,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _tarjetaDetalle(Map<String, dynamic> item) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border(left: BorderSide(color: item['color'], width: 8)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 16,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 42,
            backgroundColor: item['color'],
            child: Icon(item['icono'], color: Colors.white, size: 42),
          ),
          const SizedBox(height: 18),
          Text(
            item['titulo'],
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 12),
          Text(
            item['texto'],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey.shade700,
              fontSize: 16,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }

  Widget _puntosImportantes(Map<String, dynamic> item) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEFE7DA),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Puntos importantes',
            style: TextStyle(
              color: Color(0xFF1B396A),
              fontSize: 21,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),
          ...List.generate(
            item['puntos'].length,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle_rounded, color: item['color']),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      item['puntos'][index],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
