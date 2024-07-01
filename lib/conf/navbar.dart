import 'package:flutter/material.dart';
//import './../page/language_selection.dart';

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
      bottom: 20.0,
      child: SizedBox(
        width: 70.0,
        height: 70.0,
        child: GestureDetector(
          onTap:
              onPressed, // Utilisez la fonction onPressed fournie en paramètre
          child: Container(
            decoration: const BoxDecoration(
              color:
                  Color(0xFF327E89), // Remplacez par la couleur de votre choix
            ),
          ),
        ),
      ),
    );
  }
}
