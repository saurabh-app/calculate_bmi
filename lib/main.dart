import 'package:calculate_bmi/home_screen.dart';
import 'package:flutter/material.dart';

void main() =>runApp(BmiCalculation());



class BmiCalculation extends StatelessWidget {
  const BmiCalculation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home:HomeScreen()
    );
  }
}
