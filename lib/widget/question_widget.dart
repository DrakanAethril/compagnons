import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_translate/flutter_translate.dart';

import '../conf/false_dialog.dart';
import '../conf/question.dart';
import '../conf/select_answer_dialog.dart';
import 'image_question_widget.dart';

class QuestionWidget extends StatefulWidget {
  final Question question;
  final Function(dynamic) onAnswerSelected;
  final VoidCallback onNextPressed;
  final VoidCallback onPreviousPressed;
  final bool isAnswerChecked;
  final bool isFirstQuestion;

  const QuestionWidget({
    required this.question,
    required this.onAnswerSelected,
    required this.onNextPressed,
    required this.onPreviousPressed,
    required this.isAnswerChecked,
    required this.isFirstQuestion,
    super.key,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  List<String> selectedAnswers = [];
  String selectedImageAnswerPath = '';

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Card(
          margin: const EdgeInsets.all(0),
          child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF327E89),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          widget.question.text,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        _buildQuestionTypeWidget(),
                        const SizedBox(height: 10),
                        _buildNavigationWidget(),
                      ]))))
    ]);
  }

  Widget _buildQuestionTypeWidget() {
    switch (widget.question.type) {
      case 'multipleChoice':
        return _buildMultipleChoiceWidget();
      case 'image':
        return _buildImageWidget();
      case 'text':
        if (widget.question.textImage != '') {
          return Stack(alignment: Alignment.center, children: [
            const SizedBox(height: 30),
            Center(
                child: Image.asset(
                  widget.question.textImage,
                  width: 100,
                  height: 100,
            ))
          ]);
        } else {
          return Container();
        }

      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildImageWidget() {
    return ImageQuestionWidget(
      question: widget.question,
      onAnswerSelected: (value) {
        setState(() {
          selectedAnswers = value; //value as List<String>;
          if (kDebugMode) {
            print('selectedAnswers: $selectedAnswers');
          }
          // List<String>? correctImageAnswers =
          //     widget.question.correctImageAnswers;

          selectedAnswers.sort();
          // correctImageAnswers?.sort();

          // bool isCorrect = listEquals(selectedAnswers, correctImageAnswers);
          // print('isCorrect: $isCorrect');
        });
        widget.onAnswerSelected(selectedAnswers);
      },
    );
  }

  Widget _buildMultipleChoiceWidget() {
    return Column(
      children: widget.question.choiceAnswers!.map((choiceAnswer) {
        return CheckboxListTile(
          activeColor: const Color(0xFFEE7203),
          checkColor: const Color.fromARGB(255, 255, 255, 255),
          title: Text(
            choiceAnswer,
            style: const TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
          value: selectedAnswers.contains(choiceAnswer),
          onChanged: (value) {
            setState(() {
              if (value != null) {
                if (value) {
                  selectedAnswers.add(choiceAnswer);
                } else {
                  selectedAnswers.remove(choiceAnswer);
                }
                selectedAnswers.sort();
                widget.onAnswerSelected(selectedAnswers);
              }
            });
          },
        );
      }).toList(),
    );
  }

  Widget _buildNavigationWidget() {
    String nextLabel = translate('default.next');
    if (widget.question.nextLabel != '') {
      nextLabel = widget.question.nextLabel;
    }
    if (widget.isFirstQuestion) {
      return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ElevatedButton(
            onPressed: _onNextPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFFEE7203),
            ),
            child: Text(nextLabel))
      ]);
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: _onPreviousPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.cyan.shade400,
              ),
              child: Text(translate('default.previous'))),
          const SizedBox(width: 20),
          ElevatedButton(
              onPressed: _onNextPressed,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFFEE7203),
              ),
              child: Text(nextLabel))
        ],
      );
    }
  }

  void _onNextPressed() {
    if (widget.isAnswerChecked ||
        !widget.question.requiresAnswer ||
        (widget.question.type == 'text')) {
      selectedAnswers = [];
      if (kDebugMode) {
        print('tochenext');
      }
      widget.onNextPressed();
    } else {
      if (selectedAnswers.isEmpty && selectedImageAnswerPath.isEmpty) {
        showNoAnswerPopup(context);
      } else {
        showWrongAnswerPopup(context);
        if (kDebugMode) {
          print('tocheelse');
        }
      }
    }
  }

  void _onPreviousPressed() {
    widget.onPreviousPressed();
  }
}
