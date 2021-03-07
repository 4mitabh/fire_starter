import 'dart:ui';
import 'package:fire_starter/controllers/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavbarItem {
  Widget page;
  GButton button;
  NavbarItem({required this.page, required IconData icon, required String label})
      : this.button = GButton(
          text: label,
          icon: icon,
        );
}

class Navbar extends StatelessWidget {
  final int currentIndex;
  final List<NavbarItem> items;
  final Function(int index) onTap;
  Navbar({required this.currentIndex, required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GNav(
          tabBackgroundGradient: ThemeController.to.isDarkModeOn
              ? LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [Colors.black12, Colors.black87])
              : LinearGradient(begin: Alignment.topRight, end: Alignment.bottomLeft, colors: [Colors.lightBlue, Colors.cyan]),
          gap: 8,
          tabBorderRadius: 15,
          color: Colors.grey[600],
          activeColor: Colors.white,
          iconSize: 16,
          textStyle: TextStyle(fontSize: 12, color: Colors.white),
          tabBackgroundColor: Colors.grey[800],
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16.5),
          duration: Duration(milliseconds: 800),
          tabs: this.items.map((e) => e.button).toList(),
          selectedIndex: this.currentIndex,
          onTabChange: (index) => (this.onTap(index))),
    );
  }
}
