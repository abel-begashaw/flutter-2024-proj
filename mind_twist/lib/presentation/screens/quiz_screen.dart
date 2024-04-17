import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 113, 170),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 160, 148, 255),
        title: const Text('Quiz'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2, // 2 columns
          mainAxisSpacing: 20.0, // spacing between rows
          crossAxisSpacing: 20.0, // spacing between columns
          padding: const EdgeInsets.all(20.0),
          children: [
            _buildCategoryBox('Category 1'),
            _buildCategoryBox('Category 2'),
            _buildCategoryBox('Category 3'),
            _buildCategoryBox('Category 4'),
            _buildCategoryBox('Category 5'),
            _buildCategoryBox('Category 6'),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 160, 148, 255),
        selectedItemColor: const Color.fromARGB(255, 195, 17, 142), // Set the selected item color
        unselectedItemColor: const Color.fromARGB(255, 95, 106, 226), // Set the unselected item color
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(255, 160, 148, 255),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      )
    );
  }

  Widget _buildCategoryBox(String categoryName) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          categoryName,
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

}
