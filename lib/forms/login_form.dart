import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = true;
  bool _rememberPassword = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
    child: Column(
    children: [
    TextField(
    keyboardType: TextInputType.phone,
    decoration: const InputDecoration(
    hintText: 'Mobile Number',
    prefixIcon: Icon(Icons.phone_android_outlined),
    border: OutlineInputBorder(),
    ),
    ),
    const SizedBox(height: 20),
    TextFormField(
    obscureText: _obscureText,
    decoration: InputDecoration(
    hintText: 'Password',
    prefixIcon: const Icon(Icons.lock_outline),
    suffixIcon: IconButton(
    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
    onPressed: () {
    setState(() {
    _obscureText = !_obscureText;
    });
    },
    ),
    border: const OutlineInputBorder(),
    ),
    ),
      const SizedBox(height: 20), // Space between the two fields

      // Password field
      TextFormField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          hintText: 'Password',
          prefixIcon: const Icon(Icons.lock_outline),
          suffixIcon: IconButton(
            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
          border: const OutlineInputBorder(),
        ),
      ),
      const SizedBox(height: 10),

      // 'Remember Password' with Checkbox
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            value: _rememberPassword,
            onChanged: (bool? value) {
              setState(() {
                _rememberPassword = value ?? false;
              });
            },
          ),
          const Text('Remember Password'),
        ],
      ),
      // Login Button
      ElevatedButton(
        onPressed: () {
          // Add your button press action here
          print("Login Button Pressed");
        },
        child: const Text('Login'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50), // Full-width button
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
        ),
      ),
    ],
    ),
    );
  }
}
