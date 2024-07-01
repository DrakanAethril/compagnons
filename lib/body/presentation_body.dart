import 'package:flutter/material.dart';
import '../page/quiz_page.dart';
import 'package:flutter_translate/flutter_translate.dart';


class PresentationBody extends StatelessWidget {
  const PresentationBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xFF327E89),
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  translate('presentation.welcome'),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  translate('presentation.discover'),
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizPage(
                          languageCode: LocalizedApp.of(context)
                              .delegate
                              .currentLocale
                              .languageCode,
                        ),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        WidgetStateProperty.all<Color>(const Color(0xFFEE7203)),
                        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text(translate('presentation.next')),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}