//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './../conf/question.dart';

class ImageQuestionWidget extends StatefulWidget {
  final Question question;
  final ValueChanged<List<String>> onAnswerSelected; // Change to List<String>

  const ImageQuestionWidget({
    required this.question,
    required this.onAnswerSelected,
    super.key,
  });

  @override
  _ImageQuestionWidgetState createState() => _ImageQuestionWidgetState();
}

class _ImageQuestionWidgetState extends State<ImageQuestionWidget> {
  List<String> selectedAnswers = [];

  // void handleSelectedAnswersImage(dynamic selectedAnswers) {
  //   Question currentQuestion = widget.question;
  //    if (currentQuestion.type == 'image') {
  //      List<String>? correctImageAnswers = currentQuestion.correctImageAnswers;

  //      selectedAnswers.sort();
  //      correctImageAnswers?.sort();

  //      bool isCorrect = listEquals(selectedAnswers, correctImageAnswers);

  //      setState(() {
  //        isAnswerChecked = isCorrect;
  //        selectedAnswers = isCorrect ? selectedAnswers : [];
  //      });
  //    }
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.question.choiceAnswers != null &&
            widget.question.choiceAnswers!.length >= 2)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildImageOptions(
                widget.question.choiceAnswers!.sublist(0, 2).cast<String>()),
          ),
        const SizedBox(height: 16.0),
        if (widget.question.choiceAnswers != null &&
            widget.question.choiceAnswers!.length >= 4)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _buildImageOptions(
                widget.question.choiceAnswers!.sublist(2, 4).cast<String>()),
          ),
      ],
    );
  }

  List<Widget> _buildImageOptions(List<String> imagePaths) {
    return imagePaths.map((imagePath) {
      return GestureDetector(
        onTap: () {
          setState(() {
            if (selectedAnswers.contains(imagePath)) {
              selectedAnswers.remove(imagePath);
            } else {
              selectedAnswers.add(imagePath);
            }
          });
          widget.onAnswerSelected(selectedAnswers);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: selectedAnswers.contains(imagePath)
                  ? const Color(0xFFEE7203)
                  : Colors.transparent,
              width: 2.0,
            ),
          ),
          child: Image.asset(
            imagePath,
            width: 100.0,
            height: 100.0,
          ),
        ),
      );
    }).toList();
  }
}
