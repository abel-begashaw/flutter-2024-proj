import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Quiz App!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              
              onPressed: (null),
              child: Text(
                'Daily Twist',
                style: TextStyle(fontSize: 18, color: Colors.white24),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Unleash Your Mind Every Day!',
              style: TextStyle(fontSize: 20, color: Color.fromARGB(253, 255, 139, 67)),
            ),
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
      ),
    );
  }
}
