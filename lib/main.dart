import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import the HomeScreen
import 'cart_screen.dart'; // Import the CartScreen
import 'find_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Navigation Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MainScreen(), // Main screen with navigation
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of screens for the navbar
  final List<Widget> _pages = [
    HomeScreen(),
    CartScreen(),
    FindScreen(),
  ];

  // Function to handle tapping on navbar items
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected screen
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped, // Handle item tapping
        selectedItemColor: Color(0xFFFA5A2A), // Color for the selected icon
        unselectedItemColor: Colors.grey, // Color for unselected icons
        type: BottomNavigationBarType
            .fixed, // Ensures all items are displayed symmetrically
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), // Home icon
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite), // Cart icon
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.description), // Tracking icon (you can change this)
            label: 'Transaction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person), // Tracking icon (you can change this)
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
