import 'package:calculate_bmi/constant.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatefulWidget {
  final int bmiResult;
  const ResultsScreen({super.key, required this.bmiResult});

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  var bmiColor = Colors.white;
  var bmiText = 'Normal';
  var imagepath = 'normal';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI();
  }

  updateUI() {
    var bmi = widget.bmiResult;
    if (bmi < 18) {
      setState(() {
        bmiColor = Colors.lightBlueAccent;
        bmiText = 'Underweight';
        imagepath = 'underweight';
      });
    } else if (bmi >= 18 && bmi <= 25) {
      setState(() {
        bmiColor = Colors.green;
        bmiText = 'Normal';
        imagepath = 'normal';
      });
    } else if (bmi > 26 && bmi <= 30) {
      setState(() {
        bmiColor = Colors.yellowAccent;
        bmiText = 'OverWeight';
        imagepath = 'overweight';
      });
    } else if (bmi > 31 && bmi <= 35) {
      setState(() {
        bmiColor = Colors.yellowAccent;
        bmiText = 'Obese';
        imagepath = 'obese';
      });
    } else if (bmi >= 36) {
      setState(() {
        bmiColor = Colors.red;
        bmiText = 'ExtremeObese';
        imagepath = 'extreme';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text("Result Screen"),
       backgroundColor: darkBlueColor,),
       backgroundColor: darkBlueColor,
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
                Text('${bmiText}', style: textStyle.copyWith(color: bmiColor)),
              ],
            ),
          ),
          Image.asset('images/${imagepath}.png', height: height * 0.55),
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
