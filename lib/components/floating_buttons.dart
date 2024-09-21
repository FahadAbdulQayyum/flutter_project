import 'package:flutter/material.dart';

class FloatingButtons extends StatelessWidget {
  final Function() onWhatsAppPressed;
  final Function() onPhonePressed;

  const FloatingButtons({
    required this.onWhatsAppPressed,
    required this.onPhonePressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // WhatsApp Floating Action Button
        Positioned(
          bottom: 80.0,
          right: 0,
          child: FloatingActionButton(
            onPressed: onWhatsAppPressed,
            tooltip: 'WhatsApp',
            backgroundColor: Colors.green, // WhatsApp green color
            child: ClipOval(
              child: Image.asset(
                'assets/whatsapp.png',  // Path to your image
                width: 30.0, // Adjust size as needed
                height: 30.0,
                fit: BoxFit.contain,
              ),
            )
          ),
        ),
        // Phone Call Floating Action Button
        Positioned(
          bottom: 16.0,
          right: 0,
          child: FloatingActionButton(
            onPressed: onPhonePressed,
            tooltip: 'Phone Call',
            backgroundColor: Colors.red, // Optional: color for phone button
            child: const Icon(Icons.phone_outlined, color: Colors.white),
          ),
        ),
      ],
    );
  }
}










// import 'package:flutter/material.dart';
//
// class FloatingButtons extends StatelessWidget {
//   final Function() incrementCounter;
//
//   const FloatingButtons({required this.incrementCounter, Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         Positioned(
//           bottom: 16.0,
//           right: 0,
//           child: FloatingActionButton(
//             onPressed: incrementCounter,
//             tooltip: 'Increment',
//             child: const Icon(Icons.add_alert),
//           ),
//         ),
//         Positioned(
//           bottom: 80.0,
//           right: 0,
//           child: FloatingActionButton(
//             onPressed: () {
//               // Add another action here
//             },
//             tooltip: 'Another Action',
//             child: const Icon(Icons.star),
//           ),
//         ),
//       ],
//     );
//   }
// }
