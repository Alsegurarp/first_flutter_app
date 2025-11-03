import 'package:flutter/material.dart';
import 'package:flutter_app_1/screens/login_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController mycontroller = TextEditingController();

  // initState - Que es?
  // You set your classes to do some extra initialization work
  // If you dont do so, when el widget se construya, no tendrá los valores iniciales que esperas.
  // SO this is the best way to ensure that your widget is properly initialized before being displayed.
  @override
  void initState() {
    super.initState();
    // Aquí puedes inicializar variables o estados
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple.shade800, Colors.purple.shade200],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: LoginScreen(),
        ),
      ),
    );
  }
}
