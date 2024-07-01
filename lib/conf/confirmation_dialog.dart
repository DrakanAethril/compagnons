import 'package:flutter/material.dart';
import './../page/language_selection.dart';
import './../page/interest_page.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Intéressé(e) par une newsletter ou une formation?',
        style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Ferme le dialog actuel
            Navigator.of(context).pop(); // Ferme l'écran précédent

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const InterestPage(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: const Color(0xFFEE7203),
          ),
          child: const Text('Oui'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Ferme le dialog actuel
            Navigator.of(context).pop(); // Ferme l'écran précédent

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LanguageSelection()),
              (Route<dynamic> route) => false,
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: const Color(0xFFEE7203),
          ),
          child: const Text('Non'),
        ),
      ],
    );
  }
}
