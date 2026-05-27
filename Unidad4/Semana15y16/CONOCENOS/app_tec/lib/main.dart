
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ITSSNA',
      theme: ThemeData(
        fontFamily: 'Arial',
      ),
      home: const ConocenosPage(),
    );
  }
}

class ConocenosPage extends StatefulWidget {
  const ConocenosPage({super.key});

  @override
  State<ConocenosPage> createState() => _ConocenosPageState();
}

class _ConocenosPageState extends State<ConocenosPage> {

  bool mostrarMenu = false;

  final List<Map<String, String>> opciones = [

    {
      "titulo": "Mensaje del Director",
      "url": "https://itssna.edu.mx/mensaje-del-director/"
    },

    {
      "titulo": "Misión, Visión y Valores",
      "url": ""
    },

    {
      "titulo": "Modelo Educativo",
      "url":
      "https://www.tecnm.mx/archivos/slider/Modelo_Educativo_del_TecNM_digital_orig.pdf"
    },

    {
      "titulo": "Decreto de Creación",
      "url":
      "https://itssna.edu.mx/Formatos/2023/DECRETO_ITSSNA.pdf"
    },

    {
      "titulo": "Tour Virtual",
      "url": "https://itssna.edu.mx/"
    },

    {
      "titulo": "Identidad Institucional",
      "url": "https://itssna.edu.mx/identidad-institucional/"
    },

    {
      "titulo":
      "Política de igualdad laboral y no discriminación",

      "url":
      "https://itssna.edu.mx/documentosinsti/POLITICADEIGUALDADLABORAL.pdf"
    },

    {
      "titulo": "Control Interno",

      "url":
      "https://itssna.edu.mx/documentosinsti/CONTROL_INTERNO.pdf"
    },

    {
      "titulo": "Plan Estatal de Desarrollo 2019 - 2024",

      "url":
      "https://planeader.puebla.gob.mx/planesest/plan-estatal-de-desarrollo-2019-2024-modificacion-y-adecuacion20240925234730.pdf"
    },

    {
      "titulo":
      "Programa de Desarrollo Institucional 2019-2024",

      "url":
      "https://itssna.edu.mx/Formatos/2024/PROGRAMA_DESARROLLO_INSTITUCIONAL.pdf"
    },

    {
      "titulo":
      "Programa Sectorial de Desarrollo Integral",

      "url":
      "https://itssna.edu.mx/Formatos/2024/Programa_Sectorial_Desarrollo.pdf"
    },

    {
      "titulo": "Organigrama Subcomité de ética 2023",

      "url":
      "https://itssna.edu.mx/Images/Organigrama_SEPCI.jpeg"
    },
  ];

  Future<void> abrirEnlace(String url) async {

    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {

      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[100],

      body: Column(

        children: [

          // BARRA SUPERIOR
          Container(

            width: double.infinity,
            height: 100,

            color: const Color(0xFF0D3B66),

            child: const Center(

              child: Text(
                "INSTITUTO TECNOLÓGICO SUPERIOR\nSIERRA NEGRA DE AJALPAN",

                textAlign: TextAlign.center,

                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),

          // MENU SUPERIOR
          Container(

            width: double.infinity,
            color: const Color(0xFF163B73),

            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),

            child: GestureDetector(

              onTap: () {

                setState(() {
                  mostrarMenu = !mostrarMenu;
                });

              },

              child: const Row(

                children: [

                  Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  ),

                  SizedBox(width: 12),

                  Text(
                    "Conócenos",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Spacer(),

                  Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
            ),
          ),

          // LISTA MENU
          if (mostrarMenu)

            Expanded(

              child: ListView.builder(

                itemCount: opciones.length,

                itemBuilder: (context, index) {

                  final opcion = opciones[index];

                  return Padding(

                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 8,
                    ),

                    child: Card(

                      elevation: 5,

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),

                      child: ListTile(

                        contentPadding: const EdgeInsets.all(18),

                        leading: const Icon(
                          Icons.school,
                          color: Color(0xFF163B73),
                          size: 30,
                        ),

                        title: Text(

                          opcion["titulo"]!,

                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF163B73),
                        ),

                        onTap: () {

                          if (opcion["titulo"] ==
                              "Misión, Visión y Valores") {

                            Navigator.push(

                              context,

                              MaterialPageRoute(
                                builder: (context) =>
                                const MisionVisionPage(),
                              ),
                            );

                          } else {

                            abrirEnlace(opcion["url"]!);

                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            )

          else

            Expanded(

              child: Center(

                child: Padding(

                  padding: const EdgeInsets.all(20),

                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      Icon(
                        Icons.account_balance,
                        size: 130,
                        color: Colors.blue[900],
                      ),

                      const SizedBox(height: 25),

                      const Text(
                        "Bienvenido al apartado\nConócenos",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF163B73),
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        "Explora información institucional del Instituto Tecnológico Superior Sierra Negra de Ajalpan.",

                        textAlign: TextAlign.center,

                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class MisionVisionPage extends StatelessWidget {

  const MisionVisionPage({super.key});

  Widget tarjeta(
      String titulo,
      String contenido,
      IconData icono,
      Color color,
      ) {

    return Card(

      elevation: 6,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),

      margin: const EdgeInsets.symmetric(vertical: 15),

      child: Padding(

        padding: const EdgeInsets.all(22),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Row(

              children: [

                Icon(
                  icono,
                  color: color,
                  size: 40,
                ),

                const SizedBox(width: 10),

                Text(
                  titulo,

                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            Text(
              contenido,

              style: const TextStyle(
                fontSize: 18,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.grey[100],

      appBar: AppBar(

        backgroundColor: const Color(0xFF163B73),

        title: const Text(
          "Misión, Visión y Valores",

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          children: [

            tarjeta(

              "MISIÓN",

              "Formar ingenieros innovadores con actitud humanista y emprendedora, mediante la educación integral y personal capacitado, para coadyuvar al desarrollo de su entorno.",

              Icons.flag,

              Colors.blue,
            ),

            tarjeta(

              "VISIÓN",

              "Ser de Ajalpan y su Sierra Negra la Institución de Educación Superior Tecnológica, pilar fundamental en el desarrollo industrial, económico y tecnológico del país.",

              Icons.visibility,

              Colors.green,
            ),

            tarjeta(

              "VALORES",

              "• Trabajo en Equipo\n\n"
                  "• Liderazgo\n\n"
                  "• Alto Desempeño\n\n"
                  "• Servicio\n\n"
                  "• Calidad\n\n"
                  "• Sentido Humano",

              Icons.favorite,

              Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

