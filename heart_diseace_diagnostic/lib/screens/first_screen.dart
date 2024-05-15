import 'package:flutter/material.dart';
import 'package:heart_diseace_diagnostic/utilities/reusable_button.dart';
import 'package:provider/provider.dart';
import 'package:heart_diseace_diagnostic/screens/reusable_form_page.dart';
import 'package:heart_diseace_diagnostic/utilities/state_management.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage('images/docotr_image.png'),
                  width: width * 0.5,
                ),
              ],
            ),
            const SizedBox(height: 60),
            const Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(17.0),
                    child: Text(
                      'Welcome to our app, we are here to help you make accurate diagnosis using our machine learning model to determine if your patient has heart disease or not based on some of his data',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Consumer<Data>(builder: (context, value, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReusableButton(onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                            const ReusablePage(index: 0)));
                  }, goingRightOrLeft: true, title: 'Get started', size: 27),
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
