import 'package:flutter/material.dart';

class EgresadosPage extends StatefulWidget {
  const EgresadosPage({super.key});

  @override
  State<EgresadosPage> createState() => _EgresadosPageState();
}

class _EgresadosPageState extends State<EgresadosPage> {
  int seleccionado = 0;

  final List<Map<String, dynamic>> datos = [
    {
      'titulo': 'Seguimiento',
      'icono': Icons.track_changes_rounded,
      'color': const Color(0xFF1B396A),
      'texto':
          'El seguimiento de egresados permite conocer la situación profesional y laboral de quienes concluyeron sus estudios.',
      'puntos': [
        'Actualizar datos personales.',
        'Mantener contacto con el Instituto.',
        'Participar en actividades académicas.',
      ],
    },
    {
      'titulo': 'Bolsa de trabajo',
      'icono': Icons.work_rounded,
      'color': const Color(0xFF9D2449),
      'texto':
          'La bolsa de trabajo ayuda a vincular a los egresados con oportunidades laborales relacionadas con su perfil profesional.',
      'puntos': [
        'Consultar vacantes disponibles.',
        'Participar en procesos de selección.',
        'Fortalecer experiencia profesional.',
      ],
    },
    {
      'titulo': 'Titulación',
      'icono': Icons.school_rounded,
      'color': const Color(0xFFBC955C),
      'texto':
          'Los egresados pueden continuar con su proceso de titulación cumpliendo requisitos académicos y administrativos.',
      'puntos': [
        'Entregar documentación requerida.',
        'Cumplir lineamientos institucionales.',
        'Realizar seguimiento al trámite.',
      ],
    },
    {
      'titulo': 'Actualización',
      'icono': Icons.update_rounded,
      'color': const Color(0xFF1B396A),
      'texto':
          'El Instituto promueve la actualización profesional mediante cursos, talleres y diplomados.',
      'puntos': [
        'Fortalecer conocimientos técnicos.',
        'Actualizar competencias profesionales.',
        'Mejorar oportunidades laborales.',
      ],
    },
    {
      'titulo': 'Vinculación',
      'icono': Icons.handshake_rounded,
      'color': const Color(0xFF9D2449),
      'texto':
          'La vinculación permite fortalecer relaciones entre egresados, empresas y el Instituto.',
      'puntos': [
        'Generar redes profesionales.',
        'Apoyar proyectos institucionales.',
        'Compartir experiencias laborales.',
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
                  const SizedBox(height: 20),

                  _menuHorizontal(),

                  const SizedBox(height: 20),

                  _tarjetaDetalle(item),

                  const SizedBox(height: 20),

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
            'Egresados',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
            ),
          ),

          SizedBox(height: 10),

          Text(
            'Información y servicios para profesionistas egresados.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
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
            color: Colors.black.withValues(alpha: .10),
            blurRadius: 14,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: const Row(
        children: [
          Icon(
            Icons.workspace_premium_rounded,
            color: Colors.white,
            size: 38,
          ),

          SizedBox(width: 14),

          Expanded(
            child: Text(
              'Consulta información importante para continuar tu desarrollo profesional.',
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
      height: 135,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: datos.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
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
              width: 140,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: activo ? item['color'] : Colors.white,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(
                  color: activo
                      ? item['color']
                      : Colors.grey.shade300,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .07),
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
                    color: activo
                        ? Colors.white
                        : item['color'],
                    size: 34,
                  ),

                  const SizedBox(height: 12),

                  Text(
                    item['titulo'],
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: activo
                          ? Colors.white
                          : Colors.black87,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
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
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),

        border: Border(
          left: BorderSide(
            color: item['color'],
            width: 8,
          ),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .08),
            blurRadius: 16,
            offset: const Offset(0, 7),
          ),
        ],
      ),

      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundColor: item['color'],
            child: Icon(
              item['icono'],
              color: Colors.white,
              size: 45,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            item['titulo'],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 14),

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
      padding: const EdgeInsets.all(22),
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
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 16),

          ...List.generate(
            item['puntos'].length,
            (index) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),

              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_rounded,
                    color: item['color'],
                    size: 28,
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Text(
                      item['puntos'][index],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
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