import 'package:flutter_application_1/screens/detalle_lenguas.dart';

import 'detalle_electro.dart';
import 'detalle_administracion.dart';
import 'detalle_sistemas.dart';
import 'detalle_industrial.dart';
import 'package:flutter/material.dart';

class OfertaEducativaPage extends StatelessWidget {
  const OfertaEducativaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'OFERTA EDUCATIVA',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF1A237E),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20, top: 10),
              child: Text(
                'Selecciona una carrera para ver más información:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            _cardCarrera(
              context,
              'Ingeniería Industrial',
              Icons.factory,
              Colors.orange,
            ),
            _cardCarrera(
              context,
              'Ing. en Sistemas Computacionales',
              Icons.computer,
              Colors.blue,
            ),
            _cardCarrera(
              context,
              'Ingeniería en Administración',
              Icons.business_center,
              Colors.green,
            ),
            _cardCarrera(
              context,
              'Ingeniería Electromecánica',
              Icons.bolt,
              Colors.red,
            ),
            _cardCarrera(
              context,
              'Lenguas Extranjeras',
              Icons.language,
              Colors.purple,
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardCarrera(
    BuildContext context,
    String titulo,
    IconData icono,
    Color colorIcono,
  ) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        leading: CircleAvatar(
          //backgroundColor: colorIcono.withOpacity(0.1),
          child: Icon(icono, color: colorIcono),
        ),
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: const Text('Disponible en Modalidad Presencial'),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.grey,
        ),
       onTap: () {
          // 1. Mensaje de carga
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Cargando información de: $titulo')),
          );

          // 2. SI ES INDUSTRIAL
          if (titulo == 'Ingeniería Industrial') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetalleIndustrialPage(),
              ),
            );
          }
          // 3. SI ES SISTEMAS (Se queda comentado para que no te marque error)
          else if (titulo == 'Ing. en Sistemas Computacionales') {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetalleSistemasPage(),
              ),
            );
            
          }
           // 3. SI ES SISTEMAS (Se queda comentado para que no te marque error)
          else if (titulo == 'Ingeniería en Administración') {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetalleAdministracionPage(),
              ),
            );
            
          }
           // 3. SI ES SISTEMAS (Se queda comentado para que no te marque error)
          else if (titulo == 'Ingeniería Electromecánica') {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetalleElectroPage(),
              ),
            );
            
          }
    // 4. SI ES Lenguas (Se queda comentado para que no te marque error)
          else if (titulo == 'Lenguas Extranjeras') {
             Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetalleLenguasPage(),
              ),
            );
            
          }
        }, 
      ), // Cierra ListTile
    ); 
    } // <--- ESTA LLAVE FALTABA (Cierra el método _cardCarrera)
} // <--- ESTA LLAVE FALTABA (Cierra la clase OfertaEducativaPage)