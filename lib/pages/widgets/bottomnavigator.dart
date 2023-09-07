import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.laptop),
          label: 'Noida',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bookmark),
          label: 'Lucknow',
        ),
      ],
    );
  }
}
