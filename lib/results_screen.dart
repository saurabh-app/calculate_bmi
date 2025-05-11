import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
    final int bmiResult;
  const ResultsScreen({super.key, required this.bmiResult});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  Text("Result Screen")
        ,),
        body: Center(
          child: Text('${widget.bmiResult}')
        ),
    );
  
  }
}
