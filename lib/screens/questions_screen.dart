import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_app_1/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
    this.startQuiz,
    this.chooseAnswer,
    this.onSelectAnswer, {
    super.key,
  });
  // This says that the prompt is a Function type that takes no arguments and doesn't return anything
  final void Function() startQuiz;
  final void Function(String) chooseAnswer; // Add chooseAnswer as a parameter

  final void Function(String answer)
  onSelectAnswer; // function triggered by an event

  // Inicializamos la function startQuiz para que pueda ser usada en este widget -
  // Declararla de esta manera es mas sencillo, ya que solo cuando se monte la app, es cuando se pasa la referencia de la function

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  final PageController _pageController = PageController();

  void answeredQuestion(String selectedAnswers) {
    widget.onSelectAnswer(selectedAnswers);

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        _pageController.jumpToPage(currentQuestionIndex);
      } else {
        // Handle end of questions (e.g., show a summary or restart)
        print('Quiz completed!');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              currentQuestionIndex = index;
            });
          },
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
                    style: GoogleFonts.lato(
                      fontSize: 20,
                      color: const Color.fromARGB(255, 134, 65, 173),
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ...question.getShuffledAnswers().map(
                    (answer) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          answeredQuestion(
                            answer,
                          ); // Call answeredQuestion to handle navigation
                        },
                        child: Text(answer),
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
