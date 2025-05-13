import 'package:calculate_bmi/constant.dart';
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Result Screen")),
      body: Column(
        children: [
          Container(
            width: width,
            height: 150,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Column(
              children: [
                Text("Your BMI value is", style: textStyle),
                Text('${widget.bmiResult}', style: textStyle),
                Text("Normal", style: textStyle),
              ],
            ),
          ),
          Image.asset('images/normal.png',height: height*0.55,),
            GestureDetector(
            onTap: () {
              Navigator.pop(context);
             },
            child: Container(
              height: 50,
              margin: EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Calculate again",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
