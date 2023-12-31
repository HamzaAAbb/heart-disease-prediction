import 'package:flutter/material.dart';
import 'package:heart_diseace_diagnostic/utilities/constants.dart';
import 'package:heart_diseace_diagnostic/utilities/reusable_button.dart';
import 'package:heart_diseace_diagnostic/screens/reusable_form_page.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.result});

  final List result;

  void userClickedOnTheButton(BuildContext context, bool mybool) {
    if (mybool) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ReusablePage(index: 0)));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ReusablePage(index: titleList.length - 1)));
    }
  }

  @override
  Widget build(BuildContext context) {
    String displayMessage = result[1]
        ? 'Your patient has a ${result[0]} possibility of having a heart disease'
        : result[0];
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      displayMessage,
                      style: const TextStyle(fontSize: 35),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ReusableButton(
                  onTap: () {
                    userClickedOnTheButton(context, result[1]);
                  },
                  goingRightOrLeft: false,
                  title: (result[1])? "Try again with new input" : "Try again",
                  size: 27,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
