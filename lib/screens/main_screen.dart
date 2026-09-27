import 'package:flutter/material.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(
      child: Text(
        'Halaman Lesson / Quiz\n(Dikerjakan anggota lain)',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    ),
    const Center(
      child: Text(
        'Halaman Vocabulary\n(Dikerjakan anggota lain)',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    ),
    const Center(
      child: Text(
        'Halaman Profile / Leaderboard\n(Dikerjakan anggota lain)',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.orange.shade600,
        unselectedItemColor: Colors.grey.shade400,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book_rounded), label: 'Lesson'),
          BottomNavigationBarItem(icon: Icon(Icons.translate_rounded), label: 'Vocab'),
          BottomNavigationBarItem(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
      ),
    );
  }
}