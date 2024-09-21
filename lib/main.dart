import 'package:flutter/material.dart';
import 'components/custom_carousel.dart'; // Import CustomCarousel component
import 'components/app_drawer.dart'; // Import AppDrawer component
import 'utils/dialogs.dart'; // Import dialog functions

import 'email.dart';

void main() {
  runApp(const MyApp());
}

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final textFieldFocusNode = FocusNode();
  bool _obscured = false;

  void _toggleObscured() {
    setState(() {
      _obscured = !_obscured;
      if (textFieldFocusNode.hasPrimaryFocus) return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus = false;     // Prevents focus if tap on eye
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      obscureText: _obscured,
      focusNode: textFieldFocusNode,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never, //Hides label on focus or if filled
        labelText: "Password",
        filled: true, // Needed for adding a fill color
        fillColor: Colors.grey.shade800,
        isDense: true,  // Reduces height a bit
        border: OutlineInputBorder(
          borderSide: BorderSide.none,              // No border
          borderRadius: BorderRadius.circular(12),  // Apply corner radius
        ),
        prefixIcon: Icon(Icons.lock_rounded, size: 24),
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
          child: GestureDetector(
            onTap: _toggleObscured,
            child: Icon(
              _obscured
                  ? Icons.visibility_rounded
                  : Icons.visibility_off_rounded,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'Home Page'),
      routes: {
        '/home': (context) => const MyHomePage(title: 'Home Page'),
        '/signup': (context) => const SignUpPage(), // Assuming you have a signup page
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
    // Handle navigation based on the index
    // Example: Navigate to a different route or perform an action
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const AppDrawer(), // Drawer component
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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onNavBarTapped,
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
      ),

      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 16.0,
            right: 0,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add_alert),
            ),
          ),
          Positioned(
            bottom: 80.0,
            right: 0, // Adjust as needed
            child: FloatingActionButton(
              onPressed: () {
                // Second button action
              },
              tooltip: 'Another Action',
              child: const Icon(Icons.star), // Example icon
            ),
          ),
        ],
      ),
    );
  }
}

// Create SignUpPage widget for navigation example
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign Up')),
      // body: const Center(child: Text('Sign Up Page')),
      // body: const MyCustomForm(),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the entire form
        child: LoginForm(),
      ),
      // body: LoginForm(),
    );
  }
}

// class LoginForm extends StatefulWidget {
//   @override
//   _LoginFormState createState() => _LoginFormState();
// }
//
// class _LoginFormState extends State<LoginForm> {
//   bool _obscureText = true;
//   bool _rememberPassword = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         // Mobile number field
//         TextField(
//           keyboardType: TextInputType.phone,
//           decoration: InputDecoration(
//             hintText: 'Mobile Number',
//             prefixIcon: Icon(Icons.phone_android_outlined),
//             border: OutlineInputBorder(),
//           ),
//         ),
//         SizedBox(height: 20), // Space between the two fields
//
//         // Password field
//         TextFormField(
//           obscureText: _obscureText,
//           decoration: InputDecoration(
//             hintText: 'Password',
//             prefixIcon: Icon(Icons.lock_outline),
//             suffixIcon: IconButton(
//               icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
//               onPressed: () {
//                 setState(() {
//                   _obscureText = !_obscureText;
//                 });
//               },
//             ),
//             border: OutlineInputBorder(),
//           ),
//         ),
//         // 'Remember Password' with Checkbox
//         Row(
//           mainAxisAlignment: MainAxisAlignment.end, // Align to the right
//           children: [
//             Checkbox(
//               value: _rememberPassword,
//               onChanged: (bool? value) {
//                 setState(() {
//                   _rememberPassword = value ?? false;
//                 });
//               },
//             ),
//             Text('Remember Password'),
//           ],
//         ),
//       ],
//     );
//   }
// }


class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  bool _rememberPassword = false;

  @override
  void initState() {
    super.initState();

    // Unfocus all text fields initially when the app starts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).unfocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus the text fields when tapping outside
        FocusScope.of(context).unfocus();
      },
      child: Column(
        children: [
          // Mobile number field
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              hintText: 'Mobile Number',
              prefixIcon: Icon(Icons.phone_android_outlined),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20), // Space between the two fields

          // Password field
          TextFormField(
            obscureText: _obscureText,
            decoration: InputDecoration(
              hintText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
              suffixIcon: IconButton(
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              ),
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),

          // 'Remember Password' with Checkbox
          Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align to the right
            children: [
              Checkbox(
                value: _rememberPassword,
                onChanged: (bool? value) {
                  setState(() {
                    _rememberPassword = value ?? false;
                  });
                },
              ),
              Text('Remember Password'),
            ],
          ),
          // Button at the end
          ElevatedButton(
            onPressed: () {
              // Add your button press action here
              print("Login Button Pressed");
            },
            child: Text('Login'),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50), // Make button full-width
              backgroundColor: Colors.navy,
              foregroundColor: Colors.white
            ),
          ),
        ],
      ),
    );
  }
}


class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
        style: TextStyle(
        fontSize: 20.0,
        color: Colors.blueAccent,
        ),
        decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        prefixIcon: Icon(Icons.phone_android_outlined),
        hintText: "Mobile Number",
        border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
        borderRadius: BorderRadius.circular(25.0)),
        focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 32.0),
        borderRadius: BorderRadius.circular(25.0)))),
        ),


        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
              ),
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
                      borderRadius: BorderRadius.circular(25.0)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 32.0),
                      borderRadius: BorderRadius.circular(25.0)))),
        ),
      ],
    );
  }
}