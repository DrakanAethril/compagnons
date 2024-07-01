import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

void showNoAnswerPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(translate('default.noAnswerTitle')),
        content: Text(translate('default.noAnswerText')),
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
