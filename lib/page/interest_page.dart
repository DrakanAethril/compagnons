import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './../conf/confirmation_popup.dart';

import '../body/interest_form.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({Key? key});

  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  TextEditingController emailController = TextEditingController();
  String selectedInterest = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InterestForm(
        emailController: emailController,
        selectedInterest: selectedInterest,
        onConfirmationPressed: () {
          // Call the function to save the email to Firebase Firestore
          saveEmail(emailController.text, selectedInterest);

          // Call the function to display the confirmation popup
          showConfirmationPopup(context);
        },
        onInterestSelected: (interest) {
          setState(() {
            selectedInterest = interest;
          });
        },
      ),
    );
  }

  void showConfirmationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const ConfirmationPopup();
      },
    );
  }
}

void saveEmail(String email, String selectedInterest) {
  if (email.isNotEmpty && selectedInterest.isNotEmpty) {
    // Use a ternary condition to determine the collection name
    String collectionName =
        (selectedInterest == 'Formation') ? 'Formation' : 'Newsletter';

    FirebaseFirestore.instance.collection(collectionName).doc(email).set({
      'email': email,
    });
  } else {
    if (kDebugMode) {
      ('Email and interest cannot be empty.');
    }
  }
}
