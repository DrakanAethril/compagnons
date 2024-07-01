import '../body/presentation_body.dart';
import 'package:flutter/material.dart';



class PresentationPage extends StatelessWidget {
  const PresentationPage({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        mini: true,
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
        height: 25,
        color: Colors.cyan.shade400,
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),
        child: const Row(),
      ),
      body: const PresentationBody(),
    );
  }
}
