import 'package:flutter/material.dart';
import 'package:bit_timetable/Pages/time_table.dart';
import 'package:bit_timetable/Pages/conditional_tt.dart';

void main() {
  runApp(new LandingPage());
}

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CTT(),
      debugShowCheckedModeBanner: false,
    );
  }
}