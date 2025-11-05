import 'package:flutter/material.dart';
import 'package:flutter_app_1/screens/login_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app_1/data/questions.dart';


class ResultsScreen extends StatelessWidget {
  final List<String> selectedAnswers;

  const ResultsScreen({required this.selectedAnswers, super.key});

// Map is a data type that should declare the types of values that will store
  List<Map<String, Object>> getSummaryData(){

    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < selectedAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    // Setting the 1st answer as the right one

    return summary;

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Results')),
      body: SizedBox(
        width: double.infinity,
        child: Container(
          height: double.infinity,
          margin: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Respondiste X de Y preguntas',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              ListView.builder(
                itemCount: selectedAnswers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Answer ${index + 1}: ${selectedAnswers[index]}',
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                child: Text(
                  'Restart test',
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 134, 65, 173),
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
