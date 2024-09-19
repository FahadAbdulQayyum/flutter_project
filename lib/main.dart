// lib/main.dart
import 'package:carousel_slider/carousel_slider.dart' as custom_carousel_controller;
import 'package:flutter/material.dart';
import 'splash_screen.dart';
import 'email.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Set initial route to splash screen
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),  // Initial splash screen
        '/home': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),  // Your home screen
        '/signup': (context) => const EmailPage(), // New signup route
      },
    );
  }
}

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
    // Show the welcome dialog when the app starts
    WidgetsBinding.instance.addPostFrameCallback((_) => _showWelcomeDialog());
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _showWelcomeDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissal by tapping outside the popup
      builder: (BuildContext context) {
        return AlertDialog(
          titlePadding: EdgeInsets.zero, // No padding around the title area
          contentPadding: const EdgeInsets.all(16), // Padding inside content
          content: const Text('Welcome to my app!'),
          actions: <Widget>[
            // 'X' button at the upper right corner
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
              ),
            ),
          ],
        );
      },
    );
  }

  void _onNavBarTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Handle navigation based on the index
    // Example: Navigate to a different route or perform an action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu), // Hamburger icon
              onPressed: () {
                Scaffold.of(context).openEndDrawer(); // Opens the right-side drawer
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple, // Header background color
              ),
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.popAndPushNamed(context, '/home');
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                showAboutDialog(
                  context: context,
                  applicationName: 'Flutter Demo',
                  applicationVersion: '1.0.0',
                  children: <Widget>[
                    const Text('This is a demo app to showcase Flutter features.'),
                  ],
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Contact Us'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Add more navigation if needed
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Handle logout
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // First Carousel
            custom_carousel_controller.CarouselSlider(
              options: custom_carousel_controller.CarouselOptions(height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayInterval: Duration(seconds: 3),
              ),
              items: [
                'https://via.placeholder.com/600x200',
                'https://via.placeholder.com/600x200/FF0000/FFFFFF',
                'https://via.placeholder.com/600x200/00FF00/FFFFFF',
              ].map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(imageUrl);
                  },
                );
              }).toList(),
            ),

            // Second Carousel
            custom_carousel_controller.CarouselSlider(
              options: custom_carousel_controller.CarouselOptions(height: 200),
              items: [
                'https://via.placeholder.com/600x200/0000FF/FFFFFF',
                'https://via.placeholder.com/600x200/FFFF00/FFFFFF',
                'https://via.placeholder.com/600x200/FF00FF/FFFFFF',
              ].map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(imageUrl);
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 20), // Add some space between carousels and text

            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20), // Add some space

            // Elevated Button
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/signup');
              },
              child: const Text('Sign Up'),
            ),

            // List of Items
            ListView.builder(
              shrinkWrap: true, // Use this to fit the height of the ListView inside SingleChildScrollView
              physics: NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView
              itemCount: 5, // Number of items in the list
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Image.network(
                    'https://via.placeholder.com/50x50', // Replace with your image URL
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text('Item ${index + 1}'),
                  subtitle: Text('This is a description for item ${index + 1}.'),
                  onTap: () {
                    // Handle tap
                  },
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add_alert),
      ),
    );
  }
}











// // lib/main.dart
// import 'package:flutter/material.dart';
// import 'components/app_drawer.dart'; // Ensure the AppDrawer component is imported
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.deepPurple,
//       ),
//       home: const MyHomePage(),
//       routes: {
//         '/home': (context) => const MyHomePage(), // Define other routes here
//       },
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Home Page',
//           style: TextStyle(
//             color: Colors.yellow, // Title color
//             fontSize: 18, // Change the font size to make the text smaller
//           ),
//         ),
//         backgroundColor: Colors.deepPurple,
//         leading: Builder(
//           builder: (BuildContext context) {
//             return IconButton(
//               icon: const Icon(Icons.menu), // Hamburger icon
//               onPressed: () {
//                 Scaffold.of(context).openEndDrawer(); // Opens the right-side drawer
//               },
//             );
//           },
//         ),
//       ),
//       body: const Center(
//         child: Text('Home Page'),
//       ),
//       endDrawer: const AppDrawer(), // Right-side drawer
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
//
//
// // // lib/main.dart
// // import 'package:flutter/material.dart';
// // import 'components/app_drawer.dart'; // Ensure the AppDrawer component is imported
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.deepPurple,
// //       ),
// //       home: const MyHomePage(),
// //       routes: {
// //         '/home': (context) => const MyHomePage(), // Define other routes here
// //       },
// //     );
// //   }
// // }
// //
// // class MyHomePage extends StatelessWidget {
// //   const MyHomePage({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text(
// //           'Home Page',
// //           style: TextStyle(
// //             color: Colors.yellow, // Title color
// //             fontSize: 18, // Change the font size to make the text smaller
// //           ),
// //         ),
// //         backgroundColor: Colors.deepPurple,
// //         // Add a hamburger menu icon that opens the drawer
// //         leading: IconButton(
// //           icon: const Icon(Icons.menu), // Hamburger icon
// //           onPressed: () {
// //             Scaffold.of(context).openEndDrawer(); // Opens the right-side drawer
// //           },
// //         ),
// //       ),
// //       body: const Center(
// //         child: Text('Home Page'),
// //       ),
// //       endDrawer: const AppDrawer(), // Right-side drawer
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
// //
// //
// //
// //
// //
// // // // lib/main.dart
// // // import 'package:flutter/material.dart';
// // // import 'components/app_drawer.dart'; // Ensure the AppDrawer component is imported
// // //
// // // void main() {
// // //   runApp(const MyApp());
// // // }
// // //
// // // class MyApp extends StatelessWidget {
// // //   const MyApp({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Flutter Demo',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.deepPurple,
// // //       ),
// // //       home: const MyHomePage(),
// // //       routes: {
// // //         '/home': (context) => const MyHomePage(), // Define other routes here
// // //       },
// // //     );
// // //   }
// // // }
// // //
// // // class MyHomePage extends StatelessWidget {
// // //   const MyHomePage({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text(
// // //           'Home Page',
// // //           style: TextStyle(
// // //             color: Colors.yellow, // Title color
// // //             fontSize: 18, // Change the font size to make the text smaller
// // //           ),
// // //         ),
// // //         backgroundColor: Colors.deepPurple,
// // //       ),
// // //       body: const Center(
// // //         child: Text('Home Page'),
// // //       ),
// // //       endDrawer: const AppDrawer(), // Use `endDrawer` for right-side drawer
// // //     );
// // //   }
// // // }
// //
// //
// //
// //
// //
// //
// //
// //
// // // import 'package:flutter/material.dart';
// // // import 'components/custom_carousel.dart'; // Import CustomCarousel component
// // // import 'components/app_drawer.dart'; // Import AppDrawer component
// // // import 'utils/dialogs.dart'; // Import dialog functions
// // //
// // // void main() {
// // //   runApp(const MyApp());
// // // }
// // //
// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Flutter Demo',
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.deepPurple,
// // //       ),
// // //       home: const MyHomePage(title: 'Home Page'),
// // //       routes: {
// // //         '/home': (context) => const MyHomePage(title: 'Home Page'),
// // //         '/signup': (context) => const SignUpPage(), // Assuming you have a signup page
// // //       },
// // //     );
// // //   }
// // // }
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
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(widget.title),
// // //       ),
// // //       drawer: const AppDrawer(), // Drawer component
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
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _incrementCounter,
// // //         tooltip: 'Increment',
// // //         child: const Icon(Icons.add),
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // // // Create SignUpPage widget for navigation example
// // // class SignUpPage extends StatelessWidget {
// // //   const SignUpPage({super.key});
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(title: const Text('Sign Up')),
// // //       body: const Center(child: Text('Sign Up Page')),
// // //     );
// // //   }
// // // }
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //








// import 'package:carousel_slider/carousel_slider.dart' as custom_carousel_controller;
// import 'package:flutter/material.dart';
// import 'splash_screen.dart';
// import 'email.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       // Set initial route to splash screen
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const SplashScreen(),  // Initial splash screen
//         '/home': (context) => const MyHomePage(title: 'Flutter Demo Home Page'),  // Your home screen
//         '/signup': (context) => const EmailPage(), // New signup route
//       },
//     );
//   }
// }
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
//
//   @override
//   void initState() {
//     super.initState();
//     // Show the welcome dialog when the app starts
//     WidgetsBinding.instance.addPostFrameCallback((_) => _showWelcomeDialog());
//   }
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }
//
//   void _showWelcomeDialog() {
//     showDialog(
//       context: context,
//       barrierDismissible: false, // Prevent dismissal by tapping outside the popup
//       builder: (BuildContext context) {
//         return AlertDialog(
//           titlePadding: EdgeInsets.zero, // No padding around the title area
//           contentPadding: const EdgeInsets.all(16), // Padding inside content
//           content: const Text('Welcome to my app!'),
//           actions: <Widget>[
//             // 'X' button at the upper right corner
//             Align(
//               alignment: Alignment.topRight,
//               child: IconButton(
//                 icon: const Icon(Icons.close),
//                 onPressed: () {
//                   Navigator.of(context).pop(); // Close the dialog
//                 },
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       drawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               decoration: BoxDecoration(
//                 color: Colors.deepPurple, // Header background color
//               ),
//               child: const Text(
//                 'Menu',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 24,
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: const Icon(Icons.home),
//               title: const Text('Home'),
//               onTap: () {
//                 Navigator.popAndPushNamed(context, '/home');
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.info),
//               title: const Text('About'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//                 showAboutDialog(
//                   context: context,
//                   applicationName: 'Flutter Demo',
//                   applicationVersion: '1.0.0',
//                   children: <Widget>[
//                     const Text('This is a demo app to showcase Flutter features.'),
//                   ],
//                 );
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.contact_page),
//               title: const Text('Contact Us'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//                 // Add more navigation if needed
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.logout),
//               title: const Text('Logout'),
//               onTap: () {
//                 Navigator.pop(context); // Close the drawer
//                 // Handle logout
//               },
//             ),
//           ],
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // First Carousel
//             custom_carousel_controller.CarouselSlider(
//               options: custom_carousel_controller.CarouselOptions(height: 200,
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 aspectRatio: 16 / 9,
//                 autoPlayInterval: Duration(seconds: 3),
//               ),
//               items: [
//                 'https://via.placeholder.com/600x200',
//                 'https://via.placeholder.com/600x200/FF0000/FFFFFF',
//                 'https://via.placeholder.com/600x200/00FF00/FFFFFF',
//               ].map((imageUrl) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Image.network(imageUrl);
//                   },
//                 );
//               }).toList(),
//             ),
//
//             // Second Carousel
//             custom_carousel_controller.CarouselSlider(
//               options: custom_carousel_controller.CarouselOptions(height: 200),
//               items: [
//                 'https://via.placeholder.com/600x200/0000FF/FFFFFF',
//                 'https://via.placeholder.com/600x200/FFFF00/FFFFFF',
//                 'https://via.placeholder.com/600x200/FF00FF/FFFFFF',
//               ].map((imageUrl) {
//                 return Builder(
//                   builder: (BuildContext context) {
//                     return Image.network(imageUrl);
//                   },
//                 );
//               }).toList(),
//             ),
//
//             // // Third Carousel
//             // custom_carousel_controller.CarouselSlider(
//             //   options: custom_carousel_controller.CarouselOptions(height: 200),
//             //   items: [
//             //     'https://via.placeholder.com/600x200/00FFFF/FFFFFF',
//             //     'https://via.placeholder.com/600x200/800080/FFFFFF',
//             //     'https://via.placeholder.com/600x200/FF4500/FFFFFF',
//             //   ].map((imageUrl) {
//             //     return Builder(
//             //       builder: (BuildContext context) {
//             //         return Image.network(imageUrl);
//             //       },
//             //     );
//             //   }).toList(),
//             // ),
//
//             const SizedBox(height: 20), // Add some space between carousels and text
//
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             const SizedBox(height: 20), // Add some space
//
//             // Elevated Button
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/signup');
//               },
//               child: const Text('Sign Up'),
//             ),
//
//             // List of Items
//             ListView.builder(
//               shrinkWrap: true, // Use this to fit the height of the ListView inside SingleChildScrollView
//               physics: NeverScrollableScrollPhysics(), // Disable scrolling for the inner ListView
//               itemCount: 5, // Number of items in the list
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: Image.network(
//                     'https://via.placeholder.com/50x50', // Replace with your image URL
//                     width: 50,
//                     height: 50,
//                     fit: BoxFit.cover,
//                   ),
//                   title: Text('Item ${index + 1}'),
//                   subtitle: Text('This is a description for item ${index + 1}.'),
//                   onTap: () {
//                     // Handle tap
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add_alert),
//       ),
//     );
//   }
// }