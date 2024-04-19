import 'package:flutter/material.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Let us see how you are doing',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement action when the button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white38, // Using the primary color of the app
                      minimumSize: Size(double.infinity, 50), // Full width button
                    ),
                    child: Text(
                      'Refresh Statistics',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildStatItem('Quizzes Taken:', '5'), // Replace with actual data
                          _buildStatItem('Questions Answered:', '50'), // Replace with actual data
                          _buildStatItem('Questions Missed:', '10'), // Replace with actual data
                          const SizedBox(height: 20), // Added padding
                          const Divider(height: 20, color: Colors.grey),
                          const SizedBox(height: 20), // Added padding
                          _buildStatItem('Total Time Taken:', '2h 30m'), // Replace with actual data
                          _buildStatItem('Average Time per Question:', '3m 15s'), // Replace with actual data
                          _buildStatItem('Fastest Completion Time:', '1h 20m'), // Replace with actual data
                          _buildStatItem('Slowest Completion Time:', '3h 10m'), // Replace with actual data
                          const SizedBox(height: 20), // Added padding
                          const Divider(height: 20, color: Colors.grey),
                          const SizedBox(height: 20), // Added padding
                          const Text(
                            'Additional Stats:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          _buildStatItem('Accuracy Percentage:', '85%'), // Replace with actual data
                          _buildStatItem('Average Score:', '75'), // Replace with actual data
                          _buildStatItem('Highest Score:', '90'), // Replace with actual data
                          _buildStatItem('Lowest Score:', '60'), // Replace with actual data
                          // Add more relevant stats as needed
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_rounded),
            label: 'Teasers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: 3,
        selectedItemColor: Colors.purple,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // Handle navigation based on index
          switch (index) {
            case 0:
              // Navigate to Home
              break;
            case 1:
              // Navigate to Categories
              break;
            case 2:
              // Navigate to Teasers
              break;
            case 3:
              // Already on Profile page
              break;
            default:
          }
        },
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}

