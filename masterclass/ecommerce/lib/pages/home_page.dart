import 'package:ecommerce/components/bottom_nav_bar.dart';
import 'package:ecommerce/pages/cart_page.dart';
import 'package:ecommerce/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  final List<Widget> _pages = [ShopPage(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(onTabChange: navigateBottomBar),
      backgroundColor: Colors.grey[300],
      body: _pages[_selectedTab],
      appBar: AppBar(
        leading: Builder(
          builder: (c) {
            return IconButton(
              icon: Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                Scaffold.of(c).openDrawer();
              },
            );
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(child: Image.asset("lib/images/logo.png", color: Colors.white)),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Divider(color: Colors.grey[800]),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListTile(
                    leading: Icon(Icons.home, color: Colors.white),
                    title: Text("Home", style: TextStyle(color: Colors.white)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ListTile(
                    leading: Icon(Icons.info, color: Colors.white),
                    title: Text("About", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white),
                title: Text("Logout", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
