import 'package:flutter/material.dart';
import 'package:miut/pages/Lucknw.dart';
import 'package:miut/pages/home.dart';
import 'package:miut/pages/noida.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  Widget? selectedWidget = null;

  @override
  void initState() {
    selectedWidget = Home(onSelectedBottom);
    super.initState();
  }

  void onSelectedBottom(int index) {
    _selectedIndex = index;
    switch (index) {
      case 0:
        selectedWidget = Home(onSelectedBottom);
      case 1:
        selectedWidget = Noida(onSelectedBottom);
      case 2:
        selectedWidget = Lucknow(onSelectedBottom);
      default:
        selectedWidget = Home(onSelectedBottom);
    }
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
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
        onTap: onSelectedBottom,
      ),
      body: selectedWidget,
    );
  }
}
