import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String destinationPage;

  const BottomButton({
    required this.onPressed,
    required this.destinationPage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16.0,
      left: 16.0,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 70.0,
          height: 70.0,
          decoration: BoxDecoration(
            color: const Color(0xFF327E89),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Image.asset(
            'assets/img/img0.png',
            width: 40.0,
            height: 40.0,
            color: const Color(0xFFEE7203),
          ),
        ),
      ),
    );
  }
}

void showConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Confirmation'),
        content: const Text(
            'Êtes-vous sûr de vouloir accéder à la page de choix de langue ?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Ferme la boîte de dialogue
            },
            child: const Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(
                  'lib/page/language_selection.dart'); // Redirection vers la page de choix de langue
            },
            child: const Text('Confirmer'),
          ),
        ],
      );
    },
  );
}
