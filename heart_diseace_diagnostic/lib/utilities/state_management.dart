import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:heart_diseace_diagnostic/main.dart';
import 'package:http/http.dart' as http;

class Data with ChangeNotifier{
  List patientData = [41, 0, 1, 130, 204, 0, 0, 172, 0, 1.4, 2, 0, 2];





  String getStringToSend(){
    String result = '[';
    for (var item in patientData){
      result = '$result${item.toString()}, ';
    }
    result = '${result.substring(0, result.length - 2)} ]';
    return result;
  }

  Uri apiUrl = Uri.parse("$link/predict/");

  Future<List> getValue() async{

    String body = getStringToSend();
    
    bool resultFound = false;
    String result = '';
    
    try {
      http.Response response = await http.post(apiUrl, body: body, headers: {"Content-Type": "application/json"});
      var responseResult = jsonDecode(response.body)['value'];
      result = responseResult.toString();
      resultFound = true;
      double percentage = double.parse(result);
      result = (percentage * 100).toString();
      if (result.length > 5){
        result = result.substring(0, 5);
      }
      result = '$result %';
      return [result, resultFound];
    } catch(e){
      result = 'We were not able to connect to the server';
      resultFound = false;
    }
    return [result, resultFound];
  }

  void Function(String) getTextFieldFunction(int listIndex) {
    return (String value){
      patientData[listIndex] = value;
      notifyListeners();
    };
  }
}