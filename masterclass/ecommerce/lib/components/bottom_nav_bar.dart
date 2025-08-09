import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.onTabChange});

  final void Function(int) onTabChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        padding: EdgeInsetsGeometry.all(20),
        tabBorderRadius: 16,
        color: Colors.grey[400],
        activeColor: Colors.grey[900],
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        onTabChange: onTabChange,
        tabs: [
          GButton(icon: Icons.home, text: "Shop"),
          GButton(icon: Icons.shopping_bag, text: "Cart"),
        ],
      ),
    );
  }
}
