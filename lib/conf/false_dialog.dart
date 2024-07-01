import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

void showWrongAnswerPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(translate('default.wrongAnswerTitle')),
        content: Text(translate('default.wrongAnswerText')),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
