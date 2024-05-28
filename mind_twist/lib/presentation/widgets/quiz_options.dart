import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  final String optionText;
  final bool isSelected; // New property to indicate if the option is selected
  final VoidCallback onPressed; // Callback for handling option press

  const Option({
    Key? key,
    required this.optionText,
    this.isSelected = false, // Default isSelected value is false
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor:
              isSelected ? MaterialStateProperty.all(Colors.green) : null,
        ),
        child: Text(
          optionText,
          style: TextStyle(
            color: isSelected ? Colors.white : null,
          ),
        ),
      ),
    );
  }
}
