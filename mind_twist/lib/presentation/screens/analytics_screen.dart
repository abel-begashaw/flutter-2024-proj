import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Navigate to other screens based on index
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/home_screen'); // Navigate to HomeScreen
          break;
        case 1:
          Navigator.pushNamed(context, '/teaser'); // Navigate to TeasersScreen
          break;
        case 2:
          // Navigate to AnalyticsScreen (current screen)
          break;
        case 3:
          Navigator.pushNamed(context, '/profile'); // Navigate to ProfilePage
          break;
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 113, 170),
      // Your Scaffold contents here...
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
                      backgroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
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
                          _buildStatItem('Quizzes Taken:', '5'),
                          _buildStatItem('Questions Answered:', '50'),
                          _buildStatItem('Questions Missed:', '10'),
                          const SizedBox(height: 20),
                          const Divider(height: 20, color: Colors.grey),
                          const SizedBox(height: 20),
                          _buildStatItem('Total Time Taken:', '2h 30m'),
                          _buildStatItem('Average Time per Question:', '3m 15s'),
                          _buildStatItem('Fastest Completion Time:', '1h 20m'),
                          _buildStatItem('Slowest Completion Time:', '3h 10m'),
                          const SizedBox(height: 20),
                          const Divider(height: 20, color: Colors.grey),
                          const SizedBox(height: 20),
                          const Text(
                            'Additional Stats:',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          _buildStatItem('Accuracy Percentage:', '85%'),
                          _buildStatItem('Average Score:', '75'),
                          _buildStatItem('Highest Score:', '90'),
                          _buildStatItem('Lowest Score:', '60'),
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
            label: 'Teasers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics_rounded),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple, // Change color as needed
        backgroundColor: Colors.white, // Change color as needed
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
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
