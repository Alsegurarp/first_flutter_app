import 'package:flutter/material.dart';
import 'package:flutter_app_1/data/questions.dart';
import 'package:flutter_app_1/models/answer_button.dart';

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
        body: PageView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            final question = questions[index];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    question.text,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ...question.answers.map(
                    (answer) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: AnswerButton(
                        answer,
                        () {
                          
                        } 
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
