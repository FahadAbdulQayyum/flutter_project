import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';  // Import url_launcher

class FloatingButtons extends StatelessWidget {
  final Function() onPhonePressed;

  const FloatingButtons({
    required this.onPhonePressed,
    Key? key,
  }) : super(key: key);

  // Function to launch the URL
  Future<void> _launchWhatsAppUrl() async {
    final Uri url = Uri.parse('https://www.google.com');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // WhatsApp Floating Action Button
        Positioned(
          bottom: 80.0,
          right: 0,
          child: FloatingActionButton(
            onPressed: _launchWhatsAppUrl,  // Use the URL launcher function
            tooltip: 'WhatsApp',
            backgroundColor: Colors.green, // WhatsApp green color
            child: ClipOval(
              child: Image.asset(
                'assets/whatsapp.png',  // Path to your image
                width: 30.0, // Adjust size as needed
                height: 30.0,
                fit: BoxFit.contain,
              ),
            ),
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
//   final Function() onWhatsAppPressed;
//   final Function() onPhonePressed;
//
//   const FloatingButtons({
//     required this.onWhatsAppPressed,
//     required this.onPhonePressed,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         // WhatsApp Floating Action Button
//         Positioned(
//           bottom: 80.0,
//           right: 0,
//           child: FloatingActionButton(
//             onPressed: onWhatsAppPressed,
//             tooltip: 'WhatsApp',
//             backgroundColor: Colors.green, // WhatsApp green color
//             child: ClipOval(
//               child: Image.asset(
//                 'assets/whatsapp.png',  // Path to your image
//                 width: 30.0, // Adjust size as needed
//                 height: 30.0,
//                 fit: BoxFit.contain,
//               ),
//             )
//           ),
//         ),
//         // Phone Call Floating Action Button
//         Positioned(
//           bottom: 16.0,
//           right: 0,
//           child: FloatingActionButton(
//             onPressed: onPhonePressed,
//             tooltip: 'Phone Call',
//             backgroundColor: Colors.red, // Optional: color for phone button
//             child: const Icon(Icons.phone_outlined, color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }
