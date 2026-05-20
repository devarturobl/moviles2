import 'package:flutter/material.dart';

class CalendarioEscolarPage extends StatefulWidget {
  const CalendarioEscolarPage({super.key});

  @override
  State<CalendarioEscolarPage> createState() => _CalendarioEscolarPageState();
}

class _CalendarioEscolarPageState extends State<CalendarioEscolarPage> {
  int mesSeleccionado = 0;

  final List<Map<String, dynamic>> meses = [
    {
      'mes': 'Agosto 2025',
      'dias': 31,
      'inicioSemana': 5,
      'eventos': {
        4: 'Intersemestrales',
        5: 'Intersemestrales',
        6: 'Intersemestrales',
        7: 'Intersemestrales',
        8: 'Intersemestrales',
        11: 'Curso de inducción',
        12: 'Curso de inducción',
        13: 'Curso de inducción',
        14: 'Curso de inducción',
        15: 'Curso de inducción',
        18: 'Inscripciones',
        19: 'Inscripciones',
        20: 'Inscripciones',
        21: 'Inscripciones',
        22: 'Inscripciones',
        25: 'Inicio de clases',
      },
    },
    {
      'mes': 'Septiembre 2025',
      'dias': 30,
      'inicioSemana': 1,
      'eventos': {
        16: 'Día de la Independencia',
        23: 'Día del TecNM',
      },
    },
    {
      'mes': 'Diciembre 2025',
      'dias': 31,
      'inicioSemana': 1,
      'eventos': {
        12: 'Fin de clases',
        15: 'Evaluación complementación',
        16: 'Evaluación complementación',
        17: 'Evaluación complementación',
        18: 'Entrega de calificaciones',
        19: 'Entrega de calificaciones',
        22: 'Periodo vacacional',
        23: 'Periodo vacacional',
        24: 'Periodo vacacional',
        25: 'Navidad',
        26: 'Periodo vacacional',
        29: 'Periodo vacacional',
        30: 'Periodo vacacional',
        31: 'Periodo vacacional',
      },
    },
    {
      'mes': 'Enero 2026',
      'dias': 31,
      'inicioSemana': 4,
      'eventos': {
        1: 'Año Nuevo',
        2: 'Periodo vacacional',
        5: 'Periodo vacacional',
        6: 'Periodo vacacional',
        7: 'Intersemestrales',
        8: 'Intersemestrales',
        9: 'Intersemestrales',
        12: 'Reinscripciones',
        13: 'Reinscripciones',
        14: 'Reinscripciones',
        15: 'Reinscripciones',
        16: 'Reinscripciones',
        19: 'Entrega de calificaciones',
        20: 'Entrega de calificaciones',
        21: 'Curso de inducción',
        22: 'Curso de inducción',
        23: 'Curso de inducción',
        26: 'Inicio de clases',
      },
    },
    {
      'mes': 'Febrero 2026',
      'dias': 28,
      'inicioSemana': 0,
      'eventos': {
        2: 'Descanso obligatorio',
      },
    },
    {
      'mes': 'Marzo 2026',
      'dias': 31,
      'inicioSemana': 0,
      'eventos': {
        16: 'Descanso obligatorio',
        30: 'Periodo vacacional',
        31: 'Periodo vacacional',
      },
    },
    {
      'mes': 'Abril 2026',
      'dias': 30,
      'inicioSemana': 3,
      'eventos': {
        1: 'Periodo vacacional',
        2: 'Periodo vacacional',
        3: 'Periodo vacacional',
        6: 'Periodo vacacional',
        7: 'Periodo vacacional',
        8: 'Periodo vacacional',
        9: 'Periodo vacacional',
        10: 'Periodo vacacional',
      },
    },
    {
      'mes': 'Mayo 2026',
      'dias': 31,
      'inicioSemana': 5,
      'eventos': {
        1: 'Día del Trabajo',
        5: 'Batalla de Puebla',
        15: 'Día del Maestro',
        29: 'Fin de clases',
      },
    },
    {
      'mes': 'Junio 2026',
      'dias': 30,
      'inicioSemana': 1,
      'eventos': {
        1: 'Evaluación complementación',
        2: 'Evaluación complementación',
        3: 'Evaluación complementación',
        4: 'Entrega de calificaciones',
        5: 'Entrega de calificaciones',
      },
    },
    {
      'mes': 'Julio 2026',
      'dias': 31,
      'inicioSemana': 3,
      'eventos': {
        6: 'Periodo vacacional',
        7: 'Periodo vacacional',
        8: 'Periodo vacacional',
        9: 'Periodo vacacional',
        10: 'Periodo vacacional',
        13: 'Periodo vacacional',
        14: 'Periodo vacacional',
        15: 'Periodo vacacional',
        16: 'Periodo vacacional',
        17: 'Periodo vacacional',
        20: 'Periodo vacacional',
        21: 'Periodo vacacional',
        22: 'Periodo vacacional',
        23: 'Periodo vacacional',
        24: 'Periodo vacacional',
        27: 'Periodo vacacional',
        28: 'Periodo vacacional',
        29: 'Periodo vacacional',
        30: 'Periodo vacacional',
        31: 'Periodo vacacional',
      },
    },
  ];

  Color _colorEvento(String evento) {
    if (evento.contains('Inicio')) return const Color(0xFF1B396A);
    if (evento.contains('Inscripciones') ||
        evento.contains('Reinscripciones')) {
      return const Color(0xFF9D2449);
    }
    if (evento.contains('vacacional')) return const Color(0xFFBC955C);
    if (evento.contains('Evaluación')) return const Color(0xFF006B5B);
    if (evento.contains('Entrega')) return const Color(0xFF6A1B4D);
    if (evento.contains('Descanso') ||
        evento.contains('Año Nuevo') ||
        evento.contains('Trabajo') ||
        evento.contains('Independencia') ||
        evento.contains('Navidad') ||
        evento.contains('Puebla') ||
        evento.contains('Maestro') ||
        evento.contains('TecNM')) {
      return const Color(0xFF333333);
    }
    return const Color(0xFF607D8B);
  }

  @override
  Widget build(BuildContext context) {
    final mesActual = meses[mesSeleccionado];

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
                  _selectorMeses(),
                  const SizedBox(height: 18),
                  _calendario(mesActual),
                  const SizedBox(height: 18),
                  _eventosDelMes(mesActual),
                  const SizedBox(height: 18),
                  _leyenda(),
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
            'Calendario Escolar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w900,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Calendario académico TecNM 2025-2026.',
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
            Icons.calendar_month_rounded,
            color: Colors.white,
            size: 38,
          ),
          SizedBox(width: 14),
          Expanded(
            child: Text(
              'Consulta fechas de inicio de clases, inscripciones, evaluaciones, vacaciones y días inhábiles.',
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

  Widget _selectorMeses() {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: meses.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final activo = mesSeleccionado == index;

          return GestureDetector(
            onTap: () {
              setState(() {
                mesSeleccionado = index;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: activo ? const Color(0xFF1B396A) : Colors.white,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: activo
                      ? const Color(0xFF1B396A)
                      : Colors.grey.shade300,
                ),
              ),
              child: Center(
                child: Text(
                  meses[index]['mes'],
                  style: TextStyle(
                    color: activo ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _calendario(Map<String, dynamic> mes) {
    final eventos = mes['eventos'] as Map<int, String>;
    final dias = mes['dias'] as int;
    final inicioSemana = mes['inicioSemana'] as int;
    final totalCeldas = dias + inicioSemana;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
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
          Text(
            mes['mes'],
            style: const TextStyle(
              color: Color(0xFF1B396A),
              fontSize: 26,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: const [
              _DiaSemana('D'),
              _DiaSemana('L'),
              _DiaSemana('M'),
              _DiaSemana('M'),
              _DiaSemana('J'),
              _DiaSemana('V'),
              _DiaSemana('S'),
            ],
          ),
          const SizedBox(height: 10),
          GridView.builder(
            itemCount: totalCeldas,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              if (index < inicioSemana) {
                return const SizedBox();
              }

              final dia = index - inicioSemana + 1;
              final tieneEvento = eventos.containsKey(dia);
              final evento = eventos[dia];

              return Container(
                decoration: BoxDecoration(
                  color: tieneEvento
                      ? _colorEvento(evento!)
                      : const Color(0xFFF1F3F8),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    '$dia',
                    style: TextStyle(
                      color: tieneEvento ? Colors.white : Colors.black87,
                      fontWeight:
                          tieneEvento ? FontWeight.w900 : FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _eventosDelMes(Map<String, dynamic> mes) {
    final eventos = mes['eventos'] as Map<int, String>;
    final lista = eventos.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

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
            'Eventos del mes',
            style: TextStyle(
              color: Color(0xFF1B396A),
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 16),
          ...lista.map(
            (e) => Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: _colorEvento(e.value),
                    child: Text(
                      '${e.key}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      e.value,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
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

  Widget _leyenda() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Simbología',
            style: TextStyle(
              color: Color(0xFF1B396A),
              fontSize: 20,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),
          _leyendaItem(const Color(0xFF1B396A), 'Inicio de clases'),
          _leyendaItem(const Color(0xFF9D2449), 'Inscripciones/Reinscripciones'),
          _leyendaItem(const Color(0xFFBC955C), 'Periodo vacacional'),
          _leyendaItem(const Color(0xFF006B5B), 'Evaluación sumativa'),
          _leyendaItem(const Color(0xFF6A1B4D), 'Entrega de calificaciones'),
          _leyendaItem(const Color(0xFF333333), 'Días inhábiles'),
        ],
      ),
    );
  }

  Widget _leyendaItem(Color color, String texto) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 9),
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            texto,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _DiaSemana extends StatelessWidget {
  final String texto;

  const _DiaSemana(this.texto);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          texto,
          style: const TextStyle(
            color: Color(0xFF9D2449),
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}