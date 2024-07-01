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
    return Container(
      // Customize your bottom button widget here
    );
  }
}
