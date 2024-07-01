import 'package:flutter/material.dart';
import './../page/language_selection.dart';

class ThankYouPage extends StatelessWidget {
  const ThankYouPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Ajouter la couleur de fond ici
        color: const Color(0xFF327E89),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/img/logo.png',
                width: 100.0,
                height: 100.0,
              ),
              const SizedBox(
                height: 50,
                width: 50,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                child: Text(
                  'Merci d\'avoir participé à ce quiz. Nous espérons vous revoir au restaurant !',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                  ),
                  
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LanguageSelection()),
                  );
                },
                style: ButtonStyle(
                  backgroundColor:
                      WidgetStateProperty.all<Color>(const Color(0xFFEE7203)),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                ),
                child: const Text('Recommencer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
