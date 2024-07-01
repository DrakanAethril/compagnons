import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import '../page/presentation_page.dart';
//import '../page/quiz_page.dart';


class FrenchgrilLanguageButton extends StatelessWidget {
  const FrenchgrilLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Noémie",
          style: TextStyle(
            fontSize: 20.0,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        GestureDetector(
          onTap: () {
            changeLocale(context, 'nf_NF');
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const PresentationPage(),
              ),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color(0xFF327E89),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Image.asset(
              'assets/img/ca.png', // Remplacez par le chemin de votre image française
              width: 100.0, // Ajustez la largeur selon vos besoins
              height: 100.0, // Ajustez la hauteur selon vos besoins
            ),
          ),
        ),
      ],
    );
  }
}
