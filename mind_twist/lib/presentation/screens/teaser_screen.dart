import 'package:flutter/material.dart';

class TeasersScreen extends StatefulWidget {
  const TeasersScreen({Key? key}) : super(key: key);

  @override
  State<TeasersScreen> createState() => _TeasersScreenState();
}

class _TeasersScreenState extends State<TeasersScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Navigate to other screens based on index
      switch (index) {
        case 0:
          Navigator.pushNamed(
              context, '/home_screen'); // Navigate to HomeScreen
          break;
        case 1:
          // Navigate to TeasersScreen (current screen)
          break;
        case 2:
          Navigator.pushNamed(
              context, '/analytics'); // Navigate to AnalyticsScreen
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_mark_rounded),
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
        selectedItemColor: Colors.green, // Change color as needed
        backgroundColor: Colors.white10,
        unselectedItemColor: Colors.white, // Change color as needed
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
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
          style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
