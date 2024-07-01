import 'package:flutter/material.dart';
import './../button/af.dart';
import '../button/nf.dart';
import './../button/ae.dart';
import './../button/ne.dart';

class LanguageSelection extends StatelessWidget {
  const LanguageSelection({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF327E89), // Couleur de fond du conteneur
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(
                16.0), // Ajout du padding à l'intérieur du conteneur
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF327E89), // Couleur de fond du contenu
                borderRadius: BorderRadius.circular(20.0), // Bordure arrondie
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(height: 20),
                    Image.asset(
                      'assets/img/logo.png',
                      width: 100.0,
                      height: 100.0,
                    ),
                    const SizedBox(
                        height:
                            20), // Utilisation de SizedBox sans const pour la flexibilité
                    const Center(
                      child: Text(
                        'Choisissez votre langue et votre axe narratif',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0,
                              0), // Utilisation de la couleur noire pour le texte
                          fontSize: 22.0,
                        ),
                      ),
                    ),

                    const SizedBox(
                        height:
                            100), // Utilisation de SizedBox sans const pour la flexibilité
                    Column(
                      children: [
                        GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0,
                          shrinkWrap: true,
                          children: const [
                            FrenchgrilLanguageButton(),
                            FrenchLanguageButton(),
                            EnglishLanguageButton(),
                            EnglishgrilLanguageButton(),
                          ],
                        ),
                        const SizedBox(
                            height:
                                16), // Utilisation de SizedBox sans const pour la flexibilité
                        const Text(
                          '',
                          style: TextStyle(
                            color: Colors
                                .white, // Utilisation de la couleur blanche pour le texte
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
