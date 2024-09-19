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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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

            // // Third Carousel
            // custom_carousel_controller.CarouselSlider(
            //   options: custom_carousel_controller.CarouselOptions(height: 200),
            //   items: [
            //     'https://via.placeholder.com/600x200/00FFFF/FFFFFF',
            //     'https://via.placeholder.com/600x200/800080/FFFFFF',
            //     'https://via.placeholder.com/600x200/FF4500/FFFFFF',
            //   ].map((imageUrl) {
            //     return Builder(
            //       builder: (BuildContext context) {
            //         return Image.network(imageUrl);
            //       },
            //     );
            //   }).toList(),
            // ),

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
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add_alert),
      ),
    );
  }
}










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
//       // body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             // First Carousel
//             custom_carousel_controller.CarouselSlider(
//               options: custom_carousel_controller.CarouselOptions(height: 200,
//                 autoPlay: true,
//                 enlargeCenterPage: true,
//                 aspectRatio: 16/9,
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
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, '/signup');
//               },
//               child: const Text('Sign Up'),
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
// // // import 'package:carousel_slider/carousel_slider.dart';
// // // import 'package:carousel_slider/carousel_controller.dart';
// // import 'package:carousel_slider/carousel_controller.dart' as custom_carousel_controller;
// //
// // import 'package:flutter/material.dart';
// // import 'splash_screen.dart';
// // import 'email.dart';
// //
// // void main() {
// //   runApp(const MyApp());
// // }
// //
// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Flutter Demo',
// //       theme: ThemeData(
// //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// //         useMaterial3: true,
// //       ),
// //       // Set initial route to splash screen
// //       initialRoute: '/',
// //       routes: {
// //         '/': (context) => const SplashScreen(),  // Initial splash screen
// //         '/home': (context) => const MyHomePage(title: 'Flutter DemoOo Home Page'),  // Your home screen
// //         '/signup': (context) => const EmailPage(), // New signup route
// //       },
// //     );
// //   }
// // }
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
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     // Show the welcome dialog when the app starts
// //     WidgetsBinding.instance.addPostFrameCallback((_) => _showWelcomeDialog());
// //   }
// //
// //   void _incrementCounter() {
// //     setState(() {
// //       _counter++;
// //     });
// //   }
// //
// //   void _showWelcomeDialog() {
// //     showDialog(
// //       context: context,
// //       barrierDismissible: false, // Prevent dismissal by tapping outside the popup
// //       builder: (BuildContext context) {
// //         return AlertDialog(
// //           titlePadding: EdgeInsets.zero, // No padding around the title area
// //           contentPadding: const EdgeInsets.all(16), // Padding inside content
// //           content: const Text('Welcome to my app!'),
// //           actions: <Widget>[
// //             // 'X' button at the upper right corner
// //             Align(
// //               alignment: Alignment.topRight,
// //               child: IconButton(
// //                 icon: const Icon(Icons.close),
// //                 onPressed: () {
// //                   Navigator.of(context).pop(); // Close the dialog
// //                 },
// //               ),
// //             ),
// //           ],
// //         );
// //       },
// //     );
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// //         title: Text(widget.title),
// //       ),
// //       drawer: Drawer(
// //         child: ListView(
// //           padding: EdgeInsets.zero,
// //           children: <Widget>[
// //             DrawerHeader(
// //               decoration: BoxDecoration(
// //                 color: Colors.deepPurple, // Header background color
// //               ),
// //               child: const Text(
// //                 'Menu',
// //                 style: TextStyle(
// //                   color: Colors.white,
// //                   fontSize: 24,
// //                 ),
// //               ),
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.home),
// //               title: const Text('Home'),
// //               onTap: () {
// //                 // Navigate to home
// //                 Navigator.popAndPushNamed(context, '/home');
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.info),
// //               title: const Text('About'),
// //               onTap: () {
// //                 // Handle about navigation
// //                 // Here you might define a new AboutPage route
// //                 Navigator.pop(context); // Close the drawer
// //                 showAboutDialog(
// //                   context: context,
// //                   applicationName: 'Flutter Demo',
// //                   applicationVersion: '1.0.0',
// //                   children: <Widget>[
// //                     const Text('This is a demo app to showcase Flutter features.'),
// //                   ],
// //                 );
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.contact_page),
// //               title: const Text('Contact Us'),
// //               onTap: () {
// //                 // Handle contact navigation
// //                 Navigator.pop(context); // Close the drawer
// //                 // Add more navigation if needed
// //               },
// //             ),
// //             ListTile(
// //               leading: const Icon(Icons.logout),
// //               title: const Text('Logout'),
// //               onTap: () {
// //                 // Handle logout
// //                 Navigator.pop(context); // Close the drawer
// //               },
// //             ),
// //           ],
// //         ),
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //
// //             // First Carousel
// //             CarouselSlider(
// //               options: CarouselOptions(height: 200),
// //               items: [
// //                 'https://via.placeholder.com/600x200',
// //                 'https://via.placeholder.com/600x200/FF0000/FFFFFF',
// //                 'https://via.placeholder.com/600x200/00FF00/FFFFFF',
// //               ].map((imageUrl) {
// //                 return Builder(
// //                   builder: (BuildContext context) {
// //                     return Image.network(imageUrl);
// //                   },
// //                 );
// //               }).toList(),
// //             ),
// //
// //             // Second Carousel
// //             CarouselSlider(
// //               options: CarouselOptions(height: 200),
// //               items: [
// //                 'https://via.placeholder.com/600x200/0000FF/FFFFFF',
// //                 'https://via.placeholder.com/600x200/FFFF00/FFFFFF',
// //                 'https://via.placeholder.com/600x200/FF00FF/FFFFFF',
// //               ].map((imageUrl) {
// //                 return Builder(
// //                   builder: (BuildContext context) {
// //                     return Image.network(imageUrl);
// //                   },
// //                 );
// //               }).toList(),
// //             ),
// //
// //             // Third Carousel
// //             CarouselSlider(
// //               options: CarouselOptions(height: 200),
// //               items: [
// //                 'https://via.placeholder.com/600x200/00FFFF/FFFFFF',
// //                 'https://via.placeholder.com/600x200/800080/FFFFFF',
// //                 'https://via.placeholder.com/600x200/FF4500/FFFFFF',
// //               ].map((imageUrl) {
// //                 return Builder(
// //                   builder: (BuildContext context) {
// //                     return Image.network(imageUrl);
// //                   },
// //                 );
// //               }).toList(),
// //             ),
// //
// //             const SizedBox(height: 20), // Add some space between carousels and text
// //
// //
// //             const Text(
// //               'You have pushed the button this many times:',
// //             ),
// //             Text(
// //               '$_counter',
// //               style: Theme.of(context).textTheme.headlineMedium,
// //             ),
// //             const SizedBox(height: 20), // Add some space
// //             ElevatedButton(
// //               onPressed: () {
// //                 // Navigate to the EmailPage
// //                 Navigator.pushNamed(context, '/signup');
// //               },
// //               child: const Text('Sign Up'),
// //             ),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _incrementCounter,
// //         tooltip: 'Increment',
// //         child: const Icon(Icons.add_alert),
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
// // // // import 'package:flutter/material.dart';
// // // // import 'splash_screen.dart';
// // // //
// // // // void main() {
// // // //   runApp(MyApp());
// // // // }
// // // //
// // // // class MyApp extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       title: 'Flutter Demo',
// // // //       theme: ThemeData(primarySwatch: Colors.blue),
// // // //       initialRoute: '/',
// // // //       routes: {
// // // //         '/': (context) => SplashScreen(),
// // // //         '/home': (context) => HomeScreen(),  // Your home screen widget
// // // //       },
// // // //     );
// // // //   }
// // // // }
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // // import 'package:flutter/material.dart';
// // // import 'splash_screen.dart';
// // //
// // // void main() {
// // //   runApp(const MyApp());
// // // }
// // //
// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});
// // //
// // //   // This widget is the root of your application.
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       title: 'Flutter Demo',
// // //       theme: ThemeData(
// // //         // This is the theme of your application.
// // //         //
// // //         // TRY THIS: Try running your application with "flutter run". You'll see
// // //         // the application has a purple toolbar. Then, without quitting the app,
// // //         // try changing the seedColor in the colorScheme below to Colors.green
// // //         // and then invoke "hot reload" (save your changes or press the "hot
// // //         // reload" button in a Flutter-supported IDE, or press "r" if you used
// // //         // the command line to start the app).
// // //         //
// // //         // Notice that the counter didn't reset back to zero; the application
// // //         // state is not lost during the reload. To reset the state, use hot
// // //         // restart instead.
// // //         //
// // //         // This works for code too, not just values: Most code changes can be
// // //         // tested with just a hot reload.
// // //         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
// // //         useMaterial3: true,
// // //       ),
// // //       home: const MyHomePage(title: 'Flutter DemoOo Home Page'),
// // //     );
// // //   }
// // // }
// // //
// // // class MyHomePage extends StatefulWidget {
// // //   const MyHomePage({super.key, required this.title});
// // //
// // //   // This widget is the home page of your application. It is stateful, meaning
// // //   // that it has a State object (defined below) that contains fields that affect
// // //   // how it looks.
// // //
// // //   // This class is the configuration for the state. It holds the values (in this
// // //   // case the title) provided by the parent (in this case the App widget) and
// // //   // used by the build method of the State. Fields in a Widget subclass are
// // //   // always marked "final".
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
// // //   void _incrementCounter() {
// // //     setState(() {
// // //       // This call to setState tells the Flutter framework that something has
// // //       // changed in this State, which causes it to rerun the build method below
// // //       // so that the display can reflect the updated values. If we changed
// // //       // _counter without calling setState(), then the build method would not be
// // //       // called again, and so nothing would appear to happen.
// // //       _counter++;
// // //     });
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // This method is rerun every time setState is called, for instance as done
// // //     // by the _incrementCounter method above.
// // //     //
// // //     // The Flutter framework has been optimized to make rerunning build methods
// // //     // fast, so that you can just rebuild anything that needs updating rather
// // //     // than having to individually change instances of widgets.
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         // TRY THIS: Try changing the color here to a specific color (to
// // //         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
// // //         // change color while the other colors stay the same.
// // //         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
// // //         // Here we take the value from the MyHomePage object that was created by
// // //         // the App.build method, and use it to set our appbar title.
// // //         title: Text(widget.title),
// // //       ),
// // //       body: Center(
// // //         // Center is a layout widget. It takes a single child and positions it
// // //         // in the middle of the parent.
// // //         child: Column(
// // //           // Column is also a layout widget. It takes a list of children and
// // //           // arranges them vertically. By default, it sizes itself to fit its
// // //           // children horizontally, and tries to be as tall as its parent.
// // //           //
// // //           // Column has various properties to control how it sizes itself and
// // //           // how it positions its children. Here we use mainAxisAlignment to
// // //           // center the children vertically; the main axis here is the vertical
// // //           // axis because Columns are vertical (the cross axis would be
// // //           // horizontal).
// // //           //
// // //           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
// // //           // action in the IDE, or press "p" in the console), to see the
// // //           // wireframe for each widget.
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: <Widget>[
// // //             const Text(
// // //               'You have pushed the button this many times:',
// // //             ),
// // //             Text(
// // //               '$_counter',
// // //               style: Theme.of(context).textTheme.headlineMedium,
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: FloatingActionButton(
// // //         onPressed: _incrementCounter,
// // //         tooltip: 'Increment',
// // //         // child: const Icon(Icons.add),
// // //         child: const Icon(Icons.add_alert),
// // //
// // //       ), // This trailing comma makes auto-formatting nicer for build methods.
// // //     );
// // //   }
// // // }
