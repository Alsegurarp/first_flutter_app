import 'package:flutter/material.dart';

import 'package:flutter_app_1/screens/login_screen.dart';
import 'package:flutter_app_1/screens/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen; // Can be null - before the class renders

  @override
  void initState() {
    super.initState();
    activeScreen = LoginScreen();
    // Method to have our own initialization logic -
    // To do something when the class first mounts
    // This is basically
    // 'when the component first mounts, you should run'
    // The goes asynchronously:
    // After this, the rest of the things will run
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(startQuiz);
    });
  }

  void startQuiz() {
    // Add your quiz start logic here
    print('Quiz started!');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Quiz Screen',
                style: TextStyle(fontSize: 24, color: Colors.purple.shade800),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Go back'),
                  ),
                  SizedBox(height: 30, width: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionsScreen(startQuiz),
                        ),
                      );
                    },
                    child: const Text('Go to Questions'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
