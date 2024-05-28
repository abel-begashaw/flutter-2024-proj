import 'package:flutter/material.dart';
import 'package:mind_twist/presentation/widgets/quiz_options.dart';
import 'package:mind_twist/presentation/widgets/score_display.dart';

class QuizScreen extends StatefulWidget {
  final String categoryName;
  final List<String> questions;
  final int currentQuestionIndex;

  const QuizScreen({
    Key? key,
    required this.categoryName,
    required this.questions,
    required this.currentQuestionIndex,
  }) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _selectedOptionIndex =
      -1; // Initialize to -1 to indicate no option selected
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              widget
                  .questions[_currentQuestionIndex], // Display current question
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            Option(
              optionText: 'Option 1',
              isSelected: _selectedOptionIndex == 0,
              onPressed: () => _handleOptionSelected(0), // Pass index of option
            ),
            Option(
              optionText: 'Option 2',
              isSelected: _selectedOptionIndex == 1,
              onPressed: () => _handleOptionSelected(1), // Pass index of option
            ),
            Option(
              optionText: 'Option 3',
              isSelected: _selectedOptionIndex == 2,
              onPressed: () => _handleOptionSelected(2), // Pass index of option
            ),
            Option(
              optionText: 'Option 4',
              isSelected: _selectedOptionIndex == 3,
              onPressed: () => _handleOptionSelected(3), // Pass index of option
            ),
          ],
        ),
      ),
    );
  }

  void _handleOptionSelected(int optionIndex) {
    setState(() {
      // Update the selected option index
      _selectedOptionIndex = optionIndex;

      // Example scoring logic, update this based on your actual scoring logic
      if (optionIndex == 0) {
        // Assuming option 1 is always the correct answer for demonstration
        _score++;
      }

      // Move to the next question if available
      if (_currentQuestionIndex < widget.questions.length - 1) {
        _currentQuestionIndex++;
        _selectedOptionIndex =
            -1; // Reset selected option index for the next question
      } else {
        // Navigate to the score screen when the quiz is finished
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ScoreScreen(
              score: _score,
              totalQuestions: widget.questions.length,
            ),
          ),
        );
      }
    });
  }
}
