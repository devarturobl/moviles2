import 'package:flutter/material.dart';

class TitulacionPage extends StatefulWidget {
  const TitulacionPage({super.key});

  @override
  State<TitulacionPage> createState() => _TitulacionPageState();
}

class _TitulacionPageState extends State<TitulacionPage> {
  int seleccionado = 0;

  final List<Map<String, dynamic>> datos = [
    {
      'titulo': 'Proceso',
      'icono': Icons.school_rounded,
      'color': const Color(0xFF1B396A),
      'texto':
          'La titulación permite obtener el grado profesional conforme a los lineamientos institucionales.',
      'puntos': [
        'Cumplir requisitos académicos.',
        'Integrar expediente.',
        'Entregar documentación oficial.',
      ],
    },
    {
      'titulo': 'Opciones',
      'icono': Icons.fact_check_rounded,
      'color': const Color(0xFF9D2449),
      'texto':
          'Existen diferentes opciones de titulación dependiendo del desempeño académico y modalidad autorizada.',
      'puntos': [
        'Residencia profesional.',
        'Tesis o proyecto.',
        'Promedio general.',
      ],
    },
    {
      'titulo': 'Documentos',
      'icono': Icons.description_rounded,
      'color': const Color(0xFFBC955C),
      'texto':
          'El estudiante debe entregar documentación oficial para integrar el expediente de titulación.',
      'puntos': [
        'Certificado.',
        'CURP y acta.',
        'Constancia de liberación.',
      ],
    },
    {
      'titulo': 'Revisión',
      'icono': Icons.assignment_turned_in_rounded,
      'color': const Color(0xFF1B396A),
      'texto':
          'La documentación y requisitos son revisados antes de autorizar el proceso de titulación.',
      'puntos': [
        'Validación académica.',
        'Revisión administrativa.',
        'Autorización institucional.',
      ],
    },
    {
      'titulo': 'Título',
      'icono': Icons.workspace_premium_rounded,
      'color': const Color(0xFF9D2449),
      'texto':
          'Una vez concluido el proceso, el egresado obtiene el título profesional correspondiente.',
      'puntos': [
        'Registro oficial.',
        'Entrega de documentación.',
        'Conclusión del trámite.',
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
            'Titulación',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
            ),
          ),

          SizedBox(height: 10),

          Text(
            'Información sobre el proceso de obtención de título profesional.',
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
            Icons.menu_book_rounded,
            color: Colors.white,
            size: 38,
          ),

          SizedBox(width: 14),

          Expanded(
            child: Text(
              'Consulta los requisitos y pasos importantes del proceso de titulación.',
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