import 'package:calculate_bmi/constant.dart';
import 'package:calculate_bmi/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int heightSlider = 120;
  int age = 25;
  int weight = 45;
  Color maleColor = Color(0xff033e66);
  Color femaleColor = Color(0xff033e66);

void calculateBMI(){
  var hightInMetter=heightSlider/100;
  var bmi = weight / (hightInMetter*hightInMetter); 
  print(bmi.round());
   Navigator.push(
                context,MaterialPageRoute(builder: (context)=>ResultsScreen(bmiResult:bmi.round()))
              );
}
  void selectgender(bool gender) {
    if (gender) {
      setState(() {
        // print('Male');
        maleColor = blueColor;
        femaleColor = selectedColor;
      });
    } else {
      setState(() {
        // print('Female');
        maleColor = selectedColor;
        femaleColor = blueColor;
      });
    }
  }

  addSubAge(bool Ageadd) {
    if (Ageadd) {
      setState(() {
        age++;
      });
    } else {
      setState(() {
        age--;
      });
    }
  }
   addSubWeight(bool Weightadd) {
    if (Weightadd) {
      setState(() {
        weight++;
      });
    } else {
      setState(() {
        weight--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator", style: TextStyle(color: Colors.white)),
        backgroundColor: darkBlueColor,
      ),
      backgroundColor: darkBlueColor,

      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      selectgender(true);
                    },
                    child: ReusableCard(
                      Colour: maleColor,
                      cardChid: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FaIcon(
                              FontAwesomeIcons.mars,
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Male", style: textStyle),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectgender(false);
                      });
                    },
                    child: ReusableCard(
                      Colour: femaleColor,
                      cardChid: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: FaIcon(
                              FontAwesomeIcons.venus,
                              color: Colors.white,
                              size: 80,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text("Female", style: textStyle),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              Colour: blueColor,
              cardChid: Column(
                children: [
                  Text("Height", style: textStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${heightSlider}", style: numtextStyle),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("cm", style: numtextStyle),
                      ),
                    ],
                  ),
                  Slider(
                    min: 120,
                    max: 200,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white70,
                    thumbColor: Colors.pink,
                    value: heightSlider.toDouble(),
                    onChanged: (double value) {
                      setState(() {
                        heightSlider = value.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    Colour: blueColor,
                    cardChid: Column(
                      children: [
                        Text("Age", style: textStyle),
                        Text('${age}', style: numtextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundButton(icon: FontAwesomeIcons.plus, onPressed: () {
                                setState(() {
                                  addSubAge(true);
                                });
                              },),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundButton(icon: FontAwesomeIcons.minus, onPressed: () {
                                setState(() {
                                  addSubAge(false);
                                
                                });}),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    Colour: blueColor,
                    cardChid: Column(
                      children: [
                        Text("Weight", style: textStyle),
                        Text('${weight}', style: numtextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundButton(icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  addSubWeight(true);
                                  });
                              },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundButton(icon: FontAwesomeIcons.minus
                              ,
                              onPressed: () {
                                setState(() {
                                  addSubWeight(false);
                                  });
                              },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        GestureDetector(
            onTap: () {
              calculateBMI();
             },
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "Calculate BMI",
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

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.Colour, required this.cardChid});

  Color Colour;
  final Widget cardChid;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChid,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  const RoundButton({super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      shape: CircleBorder(),
      fillColor: Colors.blueGrey,
    );
  }
}
