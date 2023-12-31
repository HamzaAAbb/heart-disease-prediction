import 'package:flutter/material.dart';
import 'package:heart_diseace_diagnostic/screens/first_screen.dart';
import 'package:heart_diseace_diagnostic/utilities/state_management.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
const String link = 'http://10.0.2.2:8000';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Data(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FirstScreen(),
      ),
    );
  }
}
