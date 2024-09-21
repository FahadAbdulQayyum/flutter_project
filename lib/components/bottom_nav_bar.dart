import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({required this.currentIndex, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) {
        // Navigate to the Signup page when any item is tapped
        Navigator.pushNamed(context, '/signup');
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.work),
          label: 'My Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.card_membership),
          label: 'Rewards',
        ),
      ],
    );
  }
}










// import 'package:flutter/material.dart';
//
// class BottomNavBar extends StatelessWidget {
//   final int currentIndex;
//   final Function(int) onTap;
//
//   const BottomNavBar({required this.currentIndex, required this.onTap, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: currentIndex,
//       onTap: onTap,
//       items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           icon: Icon(Icons.home),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.work),
//           label: 'My Orders',
//         ),
//         BottomNavigationBarItem(
//           icon: Icon(Icons.card_membership),
//           label: 'Rewards',
//         ),
//       ],
//     );
//   }
// }
