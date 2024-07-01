import 'package:flutter/material.dart';
import '../page/thanks_page.dart';

class ConfirmationPopup extends StatelessWidget {
  const ConfirmationPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 180, 201, 223),
      title: const Text('Enregistré!', style: TextStyle(color: Colors.black)),
      content: const Text('Merci, votre choix a été enregistré.', style: TextStyle(color: Colors.black)),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const ThankYouPage()),
              (Route<dynamic> route) => false,
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: const Color(0xFFEE7203),
          ),
          child: const Text('OK'),
        ),
      ],
    );
  }
}
