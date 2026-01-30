import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Home Page';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(appTitle),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_open),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar'))
              );
            }
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is another snackbar'))
              );
            }
          ),
        ],
      ),
      drawer: Drawer(
      child: Column(
        children: [
        // 1. Encabezado con Imagen y Título
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.teal,
          ),
          currentAccountPicture:  // Espacio a la izquierda de la imagen
              CircleAvatar(
                //backgroundColor: Colors.black,
                //child: Icon(Icons.person, size: 40, color: Colors.grey),
                // Si tienes una imagen real: 
                backgroundImage: NetworkImage('https://thispersondoesnotexist.com/'),
              ),
          accountName: const Text(
            "Usuario Demo",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          accountEmail: const Text("usuario@email.com"),
        ),

        // 2. Los 3 Items del Menú
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Inicio'),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Configuración'),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          leading: const Icon(Icons.notifications),
          title: const Text('Notificaciones'),
          onTap: () => Navigator.pop(context),
        ),

        // Espaciador para empujar el último item al final
        const Spacer(),
        const Divider(),

        // 3. Item de Salir (al fondo)
        ListTile(
          leading: const Icon(Icons.logout, color: Colors.red),
          title: const Text(
            'Salir',
            style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // Aquí puedes cerrar sesión o cerrar la app
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 20), // Margen inferior
      ],
    ),
  ),
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Hola"),
          const Text("Ajalpan", 
            style: TextStyle(
              color: Colors.amberAccent,
              fontSize: 44, 
              fontWeight: FontWeight.bold)
          ),
        ],
      )),
    );
  }
}