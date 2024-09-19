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
            decoration: BoxDecoration(
              color: Colors.deepPurple,
            ),
            child: Text(
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
                applicationName: 'Flutter Demo',
                applicationVersion: '1.0.0',
                children: const <Widget>[
                  Text('This is a demo app to showcase Flutter features.'),
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










// // lib/components/app_drawer.dart
// import 'package:flutter/material.dart';
//
// class AppDrawer extends StatelessWidget {
//   const AppDrawer({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           const DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.deepPurple,
//             ),
//             child: Text(
//               'Menu',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           _createDrawerItem(
//             icon: Icons.home,
//             text: 'Home',
//             onTap: () => Navigator.popAndPushNamed(context, '/home'),
//           ),
//           _createDrawerItem(
//             icon: Icons.info,
//             text: 'About',
//             onTap: () {
//               Navigator.pop(context);
//               showAboutDialog(
//                 context: context,
//                 applicationName: 'Flutter Demo',
//                 applicationVersion: '1.0.0',
//                 children: const <Widget>[
//                   Text('This is a demo app to showcase Flutter features.'),
//                 ],
//               );
//             },
//           ),
//           _createDrawerItem(
//             icon: Icons.contact_page,
//             text: 'Contact Us',
//             onTap: () => Navigator.pop(context),
//           ),
//           _createDrawerItem(
//             icon: Icons.logout,
//             text: 'Logout',
//             onTap: () => Navigator.pop(context),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Helper method to create drawer items
//   Widget _createDrawerItem({required IconData icon, required String text, required GestureTapCallback onTap}) {
//     return ListTile(
//       leading: Icon(icon),
//       title: Text(text),
//       onTap: onTap,
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
// // // lib/components/app_drawer.dart
// // import 'package:flutter/material.dart';
// //
// // class AppDrawer extends StatelessWidget {
// //   const AppDrawer({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Drawer(
// //       child: ListView(
// //         padding: EdgeInsets.zero,
// //         children: <Widget>[
// //           DrawerHeader(
// //             decoration: const BoxDecoration(
// //               color: Colors.deepPurple,
// //             ),
// //             child: const Text(
// //               'Menu',
// //               style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 24,
// //               ),
// //             ),
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.home),
// //             title: const Text('Home'),
// //             onTap: () => Navigator.popAndPushNamed(context, '/home'),
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.info),
// //             title: const Text('About'),
// //             onTap: () {
// //               Navigator.pop(context);
// //               showAboutDialog(
// //                 context: context,
// //                 applicationName: 'Flutter Demo',
// //                 applicationVersion: '1.0.0',
// //                 children: const <Widget>[
// //                   Text('This is a demo app to showcase Flutter features.'),
// //                 ],
// //               );
// //             },
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.contact_page),
// //             title: const Text('Contact Us'),
// //             onTap: () => Navigator.pop(context),
// //           ),
// //           ListTile(
// //             leading: const Icon(Icons.logout),
// //             title: const Text('Logout'),
// //             onTap: () => Navigator.pop(context),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
