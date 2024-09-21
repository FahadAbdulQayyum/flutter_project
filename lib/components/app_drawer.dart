// lib/components/app_drawer.dart
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            // decoration: BoxDecoration(
            //   color: Colors.deepPurple,
            // ),
            child:
            Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _createDrawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () => Navigator.popAndPushNamed(context, '/home'),
          ),
          _createDrawerItem(
            icon: Icons.info,
            text: 'About',
            onTap: () {
              Navigator.pop(context);
              showAboutDialog(
                context: context,
                applicationName: 'Karsaaz Demo',
                applicationVersion: '1.0.0',
                children: const <Widget>[
                  Text('This is a Karsaaz demo app to showcase features.'),
                ],
              );
            },
          ),
          _createDrawerItem(
            icon: Icons.contact_page,
            text: 'Contact Us',
            onTap: () => Navigator.pop(context),
          ),
          _createDrawerItem(
            icon: Icons.logout,
            text: 'Logout',
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }

  // Helper method to create drawer items
  Widget _createDrawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }
}
