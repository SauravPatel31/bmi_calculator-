
import 'package:bmi_calculate/bmi2_page.dart';
import 'package:bmi_calculate/bmi3.dart';
import 'package:bmi_calculate/bmi_page.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'B.M.I Calculate',
      home: Bmi3(),
    );
  }
}