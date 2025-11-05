import 'package:flutter/material.dart';
import 'package:flutter_app_1/screens/results_screen.dart';
import 'package:flutter_app_1/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(
    this.startQuiz,
    this.chooseAnswer,
    this.onSelectAnswer, {
    required this.selectedAnswers,
    super.key,
  });

  final void Function() startQuiz;
  final void Function(String) chooseAnswer;
  final void Function(String answer) onSelectAnswer;
  final List<String> selectedAnswers;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  final PageController _pageController = PageController();

  void answeredQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        _pageController.jumpToPage(currentQuestionIndex);
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) =>
                ResultsScreen(selectedAnswers: widget.selectedAnswers),
          ),
        );
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
                    style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 134, 65, 173),
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
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
