import 'package:flutter/material.dart';
import '../components/custom_carousel.dart';
import '../components/app_drawer.dart';
import '../components/bottom_nav_bar.dart';
import '../components/floating_buttons.dart';
import '../utils/dialogs.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showWelcomeDialog(context));
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Function to handle WhatsApp button press
  void _onWhatsAppPressed() {
    // Your logic for WhatsApp button press goes here
    print("WhatsApp button pressed");
  }

  // Function to handle Phone button press
  void _onPhonePressed() {
    // Your logic for Phone button press goes here
    print("Phone button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 12, color: Colors.black), // Set default style
                children: [
                  const TextSpan(
                    text: 'Hi Guest, ',
                    style: TextStyle(color: Colors.black), // First part color
                  ),
                  const TextSpan(
                    text: 'welcome to Karsaaz.',
                    style: TextStyle(color: Colors.purple), // Second part color
                  ),
                ],
              ),
            ),
            // const SizedBox(width: 8), // Space between text and logo

            const Spacer(), // This pushes the logo to the extreme right

            GestureDetector(
              onTap: _onWhatsAppPressed, // Handle tap on WhatsApp logo
              child: Image.asset(
                'assets/logo.png', // Path to your WhatsApp logo image
                width: 24, // Adjust size as needed
                height: 24,
              ),
            ),
            const SizedBox(width: 8), // Space between logo and edge
          ],
        ),
      ),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const CustomCarousel(
              imageUrls: [
                'https://via.placeholder.com/600x200',
                'https://via.placeholder.com/600x200/FF0000/FFFFFF',
                'https://via.placeholder.com/600x200/00FF00/FFFFFF',
              ],
              autoPlay: true,
            ),
            const CustomCarousel(
              imageUrls: [
                'https://via.placeholder.com/600x200/0000FF/FFFFFF',
                'https://via.placeholder.com/600x200/FFFF00/FFFFFF',
                'https://via.placeholder.com/600x200/FF00FF/FFFFFF',
              ],
            ),
            const Text('You have pushed the button this many times:'),
            Text('$_counter'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTapped,
      ),
      floatingActionButton: FloatingButtons(
        onWhatsAppPressed: _onWhatsAppPressed, // Pass the onWhatsAppPressed function
        onPhonePressed: _onPhonePressed, // Pass the onPhonePressed function
      ),
    );
  }
}




















// import 'package:flutter/material.dart';
// import '../components/custom_carousel.dart';
// import '../components/app_drawer.dart';
// import '../components/bottom_nav_bar.dart';
// import '../components/floating_buttons.dart';
// import '../utils/dialogs.dart';
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   int _selectedIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) => showWelcomeDialog(context));
//   }
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   void _onNavBarTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   // Function to handle WhatsApp button press
//   void _onWhatsAppPressed() {
//     // Your logic for WhatsApp button press goes here
//     print("WhatsApp button pressed");
//   }
//
//   // Function to handle Phone button press
//   void _onPhonePressed() {
//     // Your logic for Phone button press goes here
//     print("Phone button pressed");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             RichText(
//               text: TextSpan(
//                 style: const TextStyle(fontSize: 12, color: Colors.black), // Set default style
//                 children: [
//                   const TextSpan(
//                     text: 'Hi Guest, ',
//                     style: TextStyle(color: Colors.black), // First part color
//                   ),
//                   const TextSpan(
//                     text: 'welcome to Karsaaz.',
//                     style: TextStyle(color: Colors.purple), // Second part color
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 8), // Space between text and title
//             Text(widget.title), // Existing title
//           ],
//         ),
//       ),
//       drawer: const AppDrawer(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             const CustomCarousel(
//               imageUrls: [
//                 'https://via.placeholder.com/600x200',
//                 'https://via.placeholder.com/600x200/FF0000/FFFFFF',
//                 'https://via.placeholder.com/600x200/00FF00/FFFFFF',
//               ],
//               autoPlay: true,
//             ),
//             const CustomCarousel(
//               imageUrls: [
//                 'https://via.placeholder.com/600x200/0000FF/FFFFFF',
//                 'https://via.placeholder.com/600x200/FFFF00/FFFFFF',
//                 'https://via.placeholder.com/600x200/FF00FF/FFFFFF',
//               ],
//             ),
//             const Text('You have pushed the button this many times:'),
//             Text('$_counter'),
//             ElevatedButton(
//               onPressed: () => Navigator.pushNamed(context, '/signup'),
//               child: const Text('Sign Up'),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: _selectedIndex,
//         onTap: _onNavBarTapped,
//       ),
//       floatingActionButton: FloatingButtons(
//         onWhatsAppPressed: _onWhatsAppPressed, // Pass the onWhatsAppPressed function
//         onPhonePressed: _onPhonePressed, // Pass the onPhonePressed function
//       ),
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
//
//
// // import 'package:flutter/material.dart';
// // import '../components/custom_carousel.dart';
// // import '../components/app_drawer.dart';
// // import '../components/bottom_nav_bar.dart';
// // import '../components/floating_buttons.dart';
// // import '../utils/dialogs.dart';
// //
// // class MyHomePage extends StatefulWidget {
// //   const MyHomePage({super.key, required this.title});
// //
// //   final String title;
// //
// //   @override
// //   State<MyHomePage> createState() => _MyHomePageState();
// // }
// //
// // class _MyHomePageState extends State<MyHomePage> {
// //   int _counter = 0;
// //   int _selectedIndex = 0;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addPostFrameCallback((_) => showWelcomeDialog(context));
// //   }
// //
// //   void _incrementCounter() {
// //     setState(() {
// //       _counter++;
// //     });
// //   }
// //
// //   void _onNavBarTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }
// //
// //   // Function to handle WhatsApp button press
// //   void _onWhatsAppPressed() {
// //     // Your logic for WhatsApp button press goes here
// //     print("WhatsApp button pressed");
// //   }
// //
// //   // Function to handle Phone button press
// //   void _onPhonePressed() {
// //     // Your logic for Phone button press goes here
// //     print("Phone button pressed");
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Text(widget.title), // Existing title
// //             RichText(
// //               text: TextSpan(
// //                 style: const TextStyle(fontSize: 12, color: Colors.black), // Set default style
// //                 children: [
// //                   const TextSpan(
// //                     text: 'Hi Guest, ',
// //                     style: TextStyle(color: Colors.black), // First part color
// //                   ),
// //                   const TextSpan(
// //                     text: 'welcome to Karsaaz.',
// //                     style: TextStyle(color: Colors.purple), // Second part color
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       drawer: const AppDrawer(),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           children: <Widget>[
// //             const CustomCarousel(
// //               imageUrls: [
// //                 'https://via.placeholder.com/600x200',
// //                 'https://via.placeholder.com/600x200/FF0000/FFFFFF',
// //                 'https://via.placeholder.com/600x200/00FF00/FFFFFF',
// //               ],
// //               autoPlay: true,
// //             ),
// //             const CustomCarousel(
// //               imageUrls: [
// //                 'https://via.placeholder.com/600x200/0000FF/FFFFFF',
// //                 'https://via.placeholder.com/600x200/FFFF00/FFFFFF',
// //                 'https://via.placeholder.com/600x200/FF00FF/FFFFFF',
// //               ],
// //             ),
// //             const Text('You have pushed the button this many times:'),
// //             Text('$_counter'),
// //             ElevatedButton(
// //               onPressed: () => Navigator.pushNamed(context, '/signup'),
// //               child: const Text('Sign Up'),
// //             ),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: BottomNavBar(
// //         currentIndex: _selectedIndex,
// //         onTap: _onNavBarTapped,
// //       ),
// //       floatingActionButton: FloatingButtons(
// //         onWhatsAppPressed: _onWhatsAppPressed, // Pass the onWhatsAppPressed function
// //         onPhonePressed: _onPhonePressed, // Pass the onPhonePressed function
// //       ),
// //     );
// //   }
// // }
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// // // import 'package:flutter/material.dart';
// // // import '../components/custom_carousel.dart';
// // // import '../components/app_drawer.dart';
// // // import '../components/bottom_nav_bar.dart';
// // // import '../components/floating_buttons.dart';
// // // import '../utils/dialogs.dart';
// // //
// // // class MyHomePage extends StatefulWidget {
// // //   const MyHomePage({super.key, required this.title});
// // //
// // //   final String title;
// // //
// // //   @override
// // //   State<MyHomePage> createState() => _MyHomePageState();
// // // }
// // //
// // // class _MyHomePageState extends State<MyHomePage> {
// // //   int _counter = 0;
// // //   int _selectedIndex = 0;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     WidgetsBinding.instance.addPostFrameCallback((_) => showWelcomeDialog(context));
// // //   }
// // //
// // //   void _incrementCounter() {
// // //     setState(() {
// // //       _counter++;
// // //     });
// // //   }
// // //
// // //   void _onNavBarTapped(int index) {
// // //     setState(() {
// // //       _selectedIndex = index;
// // //     });
// // //   }
// // //
// // //   // Function to handle WhatsApp button press
// // //   void _onWhatsAppPressed() {
// // //     // Your logic for WhatsApp button press goes here
// // //     print("WhatsApp button pressed");
// // //   }
// // //
// // //   // Function to handle Phone button press
// // //   void _onPhonePressed() {
// // //     // Your logic for Phone button press goes here
// // //     print("Phone button pressed");
// // //   }
// // //
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: Text(widget.title)),
// // //       drawer: const AppDrawer(),
// // //       body: SingleChildScrollView(
// // //         child: Column(
// // //           children: <Widget>[
// // //             const CustomCarousel(
// // //               imageUrls: [
// // //                 'https://via.placeholder.com/600x200',
// // //                 'https://via.placeholder.com/600x200/FF0000/FFFFFF',
// // //                 'https://via.placeholder.com/600x200/00FF00/FFFFFF',
// // //               ],
// // //               autoPlay: true,
// // //             ),
// // //             const CustomCarousel(
// // //               imageUrls: [
// // //                 'https://via.placeholder.com/600x200/0000FF/FFFFFF',
// // //                 'https://via.placeholder.com/600x200/FFFF00/FFFFFF',
// // //                 'https://via.placeholder.com/600x200/FF00FF/FFFFFF',
// // //               ],
// // //             ),
// // //             const Text('You have pushed the button this many times:'),
// // //             Text('$_counter'),
// // //             ElevatedButton(
// // //               onPressed: () => Navigator.pushNamed(context, '/signup'),
// // //               child: const Text('Sign Up'),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       bottomNavigationBar: BottomNavBar(
// // //         currentIndex: _selectedIndex,
// // //         onTap: _onNavBarTapped,
// // //       ),
// // //       // floatingActionButton: FloatingButtons(incrementCounter: _incrementCounter),
// // //       floatingActionButton: FloatingButtons(
// // //         onWhatsAppPressed: _onWhatsAppPressed, // Pass the onWhatsAppPressed function
// // //         onPhonePressed: _onPhonePressed, // Pass the onPhonePressed function
// // //       ),
// // //     );
// // //   }
// // // }
