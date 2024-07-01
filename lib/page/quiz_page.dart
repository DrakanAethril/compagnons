import 'dart:convert';
//import 'dart:ui_web';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './../conf/question.dart';
import '../widget/question_widget.dart';
import './../page/companion_generator.dart';

class QuizPage extends StatefulWidget {
  final String languageCode;

  const QuizPage({required this.languageCode, super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Question> questions = [];
  int currentQuestionIndex = 0;
  bool isAnswerChecked = false;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    try {
      String jsonString = await rootBundle
          .loadString('assets/i18n/${widget.languageCode}.json');
      Map<String, dynamic> data = json.decode(jsonString);
      List<dynamic> questionsData = data['question']['questions'];

      setState(() {
        questions = questionsData.map((item) {
          return Question.fromJson(item as Map<String, dynamic>);
        }).toList();
      });
    } catch (e) {
      if (kDebugMode) {
        print('Erreur lors du chargement des questions: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        //mini: true,
        shape: const CircleBorder(
          
        ),
        onPressed: () {},
        child: Container(
          padding: const EdgeInsets.only(top: 2.5, left:2.0),
          child: Image.asset(
              "assets/img/logo.png",
              width: 30,
              height: 30,
          )
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 30,
        color: Colors.cyan.shade400,
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),
        child: const Row(),
      ),
      body: currentQuestionIndex < questions.length
          ? Center(
              child: QuestionWidget(
                question: questions[currentQuestionIndex],
                onAnswerSelected: handleSelectedAnswer,
                onNextPressed: goToNextQuestion,
                onPreviousPressed: goToPreviousQuestion,
                isAnswerChecked: isAnswerChecked,
                isFirstQuestion: currentQuestionIndex == 0 ? true : false,
              ),
            )
          : const CongratulationPage(),
    );
  }

  void handleSelectedAnswer(dynamic selectedAnswer) {
    // Récupérer la question actuelle
    Question currentQuestion = questions[currentQuestionIndex];

    // Vérifier le type de la question
    if (currentQuestion.type == 'multipleChoice') {
      // Récupérer la réponse correcte
      List<String>? correctAnswers = currentQuestion.correctAnswers;
      correctAnswers?.sort();
      // Vérifier si les tableaux sont égaux
      bool isCorrect = listEquals(selectedAnswer, correctAnswers);

      // Mettre à jour l'état isAnswerChecked
      setState(() {
        if (kDebugMode) {
          print('isCorrect: $isCorrect');
          print('selectedAnswer: $selectedAnswer');
          print('correctAnswers: $correctAnswers');
        }

        isAnswerChecked = isCorrect;
      });
    } else if (currentQuestion.type == 'image') {
      List<String>? correctImageAnswers = currentQuestion.correctImageAnswers;

      // selectedAnswer.sort();
      correctImageAnswers?.sort();
      if (kDebugMode) {
        print('correctImageAnswers: $correctImageAnswers');
      }
      bool isCorrect = listEquals(selectedAnswer, correctImageAnswers);

      setState(() {
        isAnswerChecked = isCorrect;
      });
    }
  }

  void goToNextQuestion() {
    setState(() {
      currentQuestionIndex++;
      isAnswerChecked = false;
    });
  }

  void goToPreviousQuestion() {
    setState(() {
      currentQuestionIndex--;
      isAnswerChecked = false;
    });
  }
}
