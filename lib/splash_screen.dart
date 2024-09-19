import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,  // Background color for splash screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text "FAHAD" in bold
            const Text(
              'FAHAD',
              style: TextStyle(
                fontSize: 32,  // Font size
                fontWeight: FontWeight.bold,  // Bold text
                backgroundColor: Colors.greenAccent,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),  // Space between text
            // Text "ABDUL QAYYUM" in bold
            const Text(
              'ABDUL QAYYUM',
              style: TextStyle(
                fontSize: 32,  // Font size
                fontWeight: FontWeight.bold,  // Bold text
              ),
            ),
            const SizedBox(height: 20),  // Space between text and image
            // Add your logo image below
            Image.asset('assets/logo.png', width: 150, height: 150),
          ],
        ),
      ),
    );
  }
}









// import 'package:flutter/material.dart';
// import 'dart:async';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _navigateToHome();
//   }
//
//   _navigateToHome() async {
//     await Future.delayed(const Duration(seconds: 3), () {
//       Navigator.pushReplacementNamed(context, '/home');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,  // Background color for splash
//       body: Center(
//         child: Image.asset('assets/logo.png', width: 150, height: 150),  // Add your logo here
//       ),
//     );
//   }
// }








// import 'package:flutter/material.dart';
// import 'dart:async';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {
//       // Navigate to the home screen after 3 seconds
//       Navigator.pushReplacementNamed(context, '/home');
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue,
//       body: Center(
//         child: Image.asset('assets/logo.png', width: 100, height: 100),
//       ),
//     );
//   }
// }
