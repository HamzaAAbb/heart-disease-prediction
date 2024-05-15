import 'package:flutter/material.dart';
import 'package:heart_diseace_diagnostic/utilities/state_management.dart';
import 'package:provider/provider.dart';



class ReusableTextField extends StatelessWidget {
  const ReusableTextField({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<Data>(
      builder: (context, value, child) {
        return TextFormField(
          style: const TextStyle(
            fontSize: 25
          ),
          textAlign: TextAlign.center,
          initialValue: value.patientData[index].toString(),
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
            focusedBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                width: 3,
                color: Color(0xFF319997),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
              BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                width: 3,
                color: Color(0xFF319997),
              ),
            ),
          ),
          keyboardType: TextInputType.number,
          onChanged: value.getTextFieldFunction(index),
        );
      },
    );
  }
}
