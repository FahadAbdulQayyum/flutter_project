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
      appBar: AppBar(title: Text(widget.title)),
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
      // floatingActionButton: FloatingButtons(incrementCounter: _incrementCounter),
      floatingActionButton: FloatingButtons(
        onWhatsAppPressed: _onWhatsAppPressed, // Pass the onWhatsAppPressed function
        onPhonePressed: _onPhonePressed, // Pass the onPhonePressed function
      ),
    );
  }
}
