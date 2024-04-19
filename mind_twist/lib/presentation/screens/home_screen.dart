import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Navigate to other screens based on index
      switch (index) {
        case 0:
          // Navigate to HomeScreen (current screen)
          break;
        case 1:
          Navigator.pushNamed(context, '/teaser'); // Navigate to TeasersScreen
          break;
        case 2:
          Navigator.pushNamed(context, '/analytics'); // Navigate to AnalyticsScreen
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
      // Your Scaffold contents here...
      backgroundColor: const Color.fromARGB(255, 120, 113, 170),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Brain Teaser',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Daily Twist',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Unleash Your Mind Every Day!',
              style: TextStyle(fontSize: 20, color: Colors.white),
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
}
