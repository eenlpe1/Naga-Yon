import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: const [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.account_circle,
                color: Colors.grey,
                size: 50,
              ),
            ),
            accountName: Text("Your Name"),
            accountEmail: Text("yourname@example.com"),
          ),
          ListTile(),
          // Add more drawer items as needed
        ],
      ),
    );
  }
}
