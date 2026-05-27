import 'package:flutter/material.dart';

class CuotasVigentesPage extends StatefulWidget {
  const CuotasVigentesPage({super.key});

  @override
  State<CuotasVigentesPage> createState() => _CuotasVigentesPageState();
}

class _CuotasVigentesPageState extends State<CuotasVigentesPage> {
  int seleccionado = 0;

  final List<Map<String, dynamic>> datos = [
    {
      'titulo': 'Ficha',
      'precio': '\$735.00',
      'icono': Icons.receipt_long_rounded,
      'color': const Color(0xFF1B396A),
      'texto':
          'Pago correspondiente al derecho para realizar el proceso de admisión al Instituto.',
      'puntos': [
        'Concepto: Ficha de admisión ITSSNA Ajalpan.',
        'Pago en bancos autorizados o caja del Instituto.',
        'Necesario para continuar con el registro de examen.',
      ],
    },
    {
      'titulo': 'Inscripción',
      'precio': '\$735.00',
      'icono': Icons.app_registration_rounded,
      'color': const Color(0xFF9D2449),
      'texto':
          'Pago requerido para formalizar el ingreso o reinscripción del estudiante al periodo escolar.',
      'puntos': [
        'Concepto usado en orden de pago: Reinscripción.',
        'Debe sellarse el recibo en caja del Instituto.',
        'Forma parte del proceso de inscripción.',
      ],
    },
    {
      'titulo': 'Seguro',
      'precio': '\$150.00',
      'icono': Icons.health_and_safety_rounded,
      'color': const Color(0xFFBC955C),
      'texto':
          'Servicio de seguro contra accidentes para protección del estudiante durante el periodo correspondiente.',
      'puntos': [
        'Concepto: Servicio de seguro contra accidentes.',
        'Pago obligatorio dentro del proceso escolar.',
        'Se realiza mediante orden de pago.',
      ],
    },
    {
      'titulo': 'Biblioteca',
      'precio': '\$130.00',
      'icono': Icons.local_library_rounded,
      'color': const Color(0xFF1B396A),
      'texto':
          'Servicio anual de biblioteca virtual para apoyo académico y consulta de recursos digitales.',
      'puntos': [
        'Concepto: Servicio anual de biblioteca virtual.',
        'Pago anual.',
        'Apoya el acceso a materiales académicos.',
      ],
    },
    {
      'titulo': 'Credencial',
      'precio': '\$59.00',
      'icono': Icons.badge_rounded,
      'color': const Color(0xFF9D2449),
      'texto':
          'Pago por expedición de credencial institucional para identificación del estudiante.',
      'puntos': [
        'Concepto: Expedición de credencial.',
        'Identificación oficial dentro del Instituto.',
        'Debe conservarse vigente y en buen estado.',
      ],
    },
  ];

  int get total {
    return 735 + 735 + 150 + 130 + 59;
  }

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
                  _totalCard(),
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
            'Cuotas Vigentes',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Pagos escolares del proceso académico.',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _totalCard() {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xFF9D2449),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .12),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 34,
            backgroundColor: Colors.white,
            child: Icon(
              Icons.payments_rounded,
              color: Color(0xFF9D2449),
              size: 38,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total aproximado',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$$total.00 MXN',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Text(
                  'Incluye ficha, inscripción, seguro, biblioteca y credencial.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuHorizontal() {
    return SizedBox(
      height: 145,
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
              width: 145,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: activo ? item['color'] : Colors.white,
                borderRadius: BorderRadius.circular(26),
                border: Border.all(
                  color: activo ? item['color'] : Colors.grey.shade300,
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
                    color: activo ? Colors.white : item['color'],
                    size: 34,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item['titulo'],
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: activo ? Colors.white : Colors.black87,
                      fontWeight: FontWeight.w900,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item['precio'],
                    style: TextStyle(
                      color: activo ? Colors.white : const Color(0xFF1B396A),
                      fontWeight: FontWeight.w900,
                      fontSize: 17,
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
          const SizedBox(height: 18),
          Text(
            item['titulo'],
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item['precio'],
            style: const TextStyle(
              color: Color(0xFF9D2449),
              fontSize: 32,
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
            'Detalles del pago',
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
          const SizedBox(height: 8),
          const Text(
            'Nota: Los montos pueden cambiar por ciclo escolar. Verifica siempre en Servicios Escolares o en la convocatoria oficial vigente.',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 13,
              fontStyle: FontStyle.italic,
              height: 1.35,
            ),
          ),
        ],
      ),
    );
  }
}