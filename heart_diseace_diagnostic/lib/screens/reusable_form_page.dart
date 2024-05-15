import 'package:flutter/material.dart';
import 'package:heart_diseace_diagnostic/screens/results_screen.dart';
import 'package:heart_diseace_diagnostic/utilities/constants.dart';
import 'package:heart_diseace_diagnostic/utilities/reusable_button.dart';
import 'package:heart_diseace_diagnostic/utilities/reusable_text_field.dart';
import 'package:provider/provider.dart';
import 'package:heart_diseace_diagnostic/utilities/state_management.dart';

class ReusablePage extends StatelessWidget {
  const ReusablePage({super.key, required this.index});
  final int index;

  Widget getLastRow(int index, BuildContext context) {
    if (index != 0 && index != titleList.length - 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ReusableButton(
            onTap: () {
              Navigator.pop(context);
            },
            goingRightOrLeft: false,
            title: 'Previous',
            size: 27,
          ),
          ReusableButton(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ReusablePage(index: index + 1)));
            },
            goingRightOrLeft: true,
            title: 'Next',
            size: 27,
          ),
        ],
      );
    } else if (index == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ReusableButton(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ReusablePage(index: index + 1)));
            },
            goingRightOrLeft: true,
            title: 'Next',
            size: 27,
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ReusableButton(
            onTap: () {
              Navigator.pop(context);
            },
            goingRightOrLeft: false,
            title: 'Previous',
            size: 27,
          ),
          Consumer<Data>(
            builder: (context, value, child) => ReusableButton(
              onTap: () async{
                List mylist = [];
                try {
                  mylist = await value.getValue();
                } catch (e) {
                  mylist = ['We were not able to connect to the server', false];
                }
                if (context.mounted) Navigator.push(context, MaterialPageRoute(builder: (context) => ResultScreen(result: mylist)));
              },
              goingRightOrLeft: true,
              title: 'Get result',
              size: 27,
            ),
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        titleList[index][0],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 33,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Text(
                          titleList[index][1],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18),
                        ))
                  ],
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 10),
              child: ReusableTextField(index: index),
            ),
            getLastRow(index, context),
          ],
        ),
      ),
    );
  }
}
