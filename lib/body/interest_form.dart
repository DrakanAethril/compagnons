import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InterestForm extends StatelessWidget {
  final TextEditingController emailController;
  final String selectedInterest;
  final VoidCallback onConfirmationPressed;
  final Function(String) onInterestSelected;

  const InterestForm({
    required this.emailController,
    required this.selectedInterest,
    required this.onConfirmationPressed,
    required this.onInterestSelected,
    super.key,
  });

  bool isEmailValid(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$',
    );
    return emailRegex.hasMatch(email);
  }

  void enregistrerEmail(String email, String interest) async {
    if (email.isNotEmpty) {
      await FirebaseFirestore.instance.collection(interest).doc(email).set({
        'email': email,
      });
    } else {
      if (kDebugMode) {
        print('Veuillez entrer une adresse e-mail.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF327E89),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Choisissez votre intérêt :',
              style: TextStyle(color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    onInterestSelected('Formation');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: selectedInterest == 'Formation'
                        ? Colors.blue
                        : const Color(0xFFEE7203),
                  ),
                  child: const Text('Formation'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    onInterestSelected('Newsletter');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: selectedInterest == 'Newsletter'
                        ? Colors.blue
                        : const Color(0xFFEE7203),
                  ),
                  child: const Text('Newsletter'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Appel de la fonction pour enregistrer l'e-mail dans la base de données
                enregistrerEmail(emailController.text, selectedInterest);

                // Appel de la fonction pour afficher la popup de confirmation
                onConfirmationPressed();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFFEE7203),
              ),
              child: const Text('Valider'),
            ),
          ],
        ),
      ),
    );
  }
}
