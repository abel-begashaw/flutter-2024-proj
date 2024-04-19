import 'package:flutter/material.dart';

class TeaserScreen extends StatefulWidget {
  const TeaserScreen({
    super.key,
  });

  @override
  State<TeaserScreen> createState() => _TeaserScreenState();
}

class _TeaserScreenState extends State<TeaserScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 120, 113, 170),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 144, 134, 201),
        title: const Text(
          'Teasers',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
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
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Catagories',
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
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 114, 244, 201),
        onTap: _onItemTapped,
        backgroundColor: Colors.white10,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
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
