import 'package:flutter/material.dart';
import 'package:mind_twist/presentation/screens/teaser/quiz_screen.dart';
import 'package:mind_twist/presentation/widgets/category_options.dart';

class TeaserScreen extends StatelessWidget {
  final Map<String, List<String>> categoryQuestions = {
    "Capital Cities": [
      "What is the capital of France?",
      "What is the capital of Germany?",
      // Add more questions for this category
    ],
    "Math": [
      "What is 2 + 2?",
      "What is the square root of 16?",
      // Add more questions for this category
    ],
    "History": [
      "Who was the first president of the United States?",
      "When was the Declaration of Independence signed?",
      // Add more questions for this category
    ],
    "Geography": [
      "What is the largest ocean on Earth?",
      "What is the longest river in the world?",
      // Add more questions for this category
    ],
    "Science": [
      "What is the chemical symbol for water?",
      "What planet is known as the Red Planet?",
      // Add more questions for this category
    ],
    "Tease": [
      "This is a sample question for the Tease category.",
      "Here is another sample question for the Tease category.",
      // Add more questions for this category
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 1,
          ),
          itemCount: categoryQuestions.keys.length,
          itemBuilder: (context, index) {
            String categoryName = categoryQuestions.keys.elementAt(index);
            return CategoryOption(
              categoryName: categoryName,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      categoryName: categoryName,
                      questions: categoryQuestions[categoryName]!,
                      currentQuestionIndex: 0,
                    ),
                  ),
                );
                print('Tapped on $categoryName');
              },
            );
          },
        ),
      ),
    );
  }
}
