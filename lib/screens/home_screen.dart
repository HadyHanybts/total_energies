import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:total_energies/core/constant/colors.dart';
import 'package:total_energies/screens/promotions_screen.dart';
import 'package:total_energies/screens/stations_screen.dart';
import 'package:total_energies/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PromotionsScreen(),
    StationListScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: secondColors,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer), label: 'bottom_bar.promotions'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'bottom_bar.stations'.tr),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'bottom_bar.profile'.tr),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        showUnselectedLabels: false,
        selectedFontSize: 16,
      ),
    );
  }
}
