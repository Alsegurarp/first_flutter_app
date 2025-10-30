import 'package:flutter/material.dart';

import 'package:flutter_app_1/screens/login_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.startQuiz, {super.key});
  // This says that the prompt is a Function type that takes no arguments and doesn't return anything
  final void Function() startQuiz;
  // Inicializamos la function startQuiz para que pueda ser usada en este widget -
  // Declararla de esta manera es mas sencillo, ya que solo cuando se monte la app, es cuando se pasa la referencia de la function

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'The question... ',
                  style: TextStyle(fontSize: 24, color: Colors.purple.shade800),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.red),
                  ),
                  child: Text('1', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue),
                  ),
                  child: Text('2', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      Colors.green,
                    ),
                  ),
                  child: Text('3', style: TextStyle(color: Colors.white)),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll<Color>(
                      const Color.fromARGB(255, 189, 38, 169),
                    ),
                  ),
                  child: Text('4', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
