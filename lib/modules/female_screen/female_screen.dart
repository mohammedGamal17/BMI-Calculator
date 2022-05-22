import 'package:bmi_calculator/modules/female_result/female_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../main_page/main_page.dart';
import '../male_screen/male_screen.dart';
import 'dart:math';

class FemaleScreen extends StatefulWidget{
  const FemaleScreen({Key? key}) : super(key: key);

  @override
  State<FemaleScreen> createState() => _FemaleScreenState();
}

class _FemaleScreenState extends State<FemaleScreen> {
  double height = 160.0;
  double weight = 50.0;
  double bmi = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            color: Colors.purple,
            onPressed: () {
              Navigator.pop(context, MaterialPageRoute(builder: (context) {
                return MainPage();
              }));
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: const Text(
            'Female',
            style: TextStyle(
              color: Colors.purple,
              fontSize: 20.0,
            ),
          ),
        ),
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                headBar(text: 'Your Height And Widget'),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${height.round()}',
                                style: const TextStyle(
                                  color: Colors.purple,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RotatedBox(
                                quarterTurns: 3,
                                child: Slider(
                                  value: height,
                                  max: 220.0,
                                  min: 80.0,
                                  label: '${height.round()}',
                                  onChanged: (double value) {
                                    setState(() {
                                      height = value;
                                    });
                                  },
                                ),
                              ),
                              const Text(
                                'Height',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage('assets/images/female.png'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${weight.round()}',
                                style: const TextStyle(
                                  color: Colors.purple,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RotatedBox(
                                quarterTurns: 3,
                                child: Slider(
                                  value: weight,
                                  max: 150.0,
                                  min: 40.0,
                                  label: '${weight.round()}',
                                  onChanged: (double value) {
                                    setState(() {
                                      weight = value;
                                    });
                                  },
                                ),
                              ),
                              const Text(
                                'Height',
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: actionButton(text: 'next', function: (){
                    bmi = (weight / pow((height / 100), 2));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return FemaleResult(bmi: bmi);
                        }));
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}