import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;

  const BackgroundContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: _buildBackgroundImage(),
      ),
      child: child,
    );
  }

  DecorationImage _buildBackgroundImage() {
    // Assurez-vous que le fichier d'image existe avant de l'utiliser
    AssetImage backgroundImage = const AssetImage('assets/img/img1.png');

    return DecorationImage(
      image: backgroundImage,
      fit: BoxFit.cover,
    );
  }
}
