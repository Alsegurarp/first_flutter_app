import 'package:flutter/material.dart';

import 'package:flutter_app_1/screens/quiz.dart';
import 'package:flutter_app_1/screens/questions_screen.dart';

final imagen = 'assets/images/quiz-logo.png';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagen, height: 160, width: 160, color: Colors.white54),
          const SizedBox(height: 80),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Quiz()),
              );
            }, // Para navegar entre pantallas - Se necesita una manera de remplazar la pantalla actual en main()
            // Para hacerlo, se necesita lifting up state & conditional rendering
            style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              backgroundColor: Colors.transparent,
            ),
            icon: Icon(
              Icons.add,
              color: const Color.fromARGB(255, 207, 167, 255),
              size: 32,
            ),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                fontSize: 24,
                color: Color.fromARGB(255, 204, 161, 255),
                height: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
