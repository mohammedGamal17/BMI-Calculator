import 'package:bmi_calculator/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

import 'package:flutter/material.dart';

import '../female_screen/female_screen.dart';

class FemaleResult extends StatelessWidget{

  final double bmi;

  // ignore: use_key_in_widget_constructors
  FemaleResult({
    required this.bmi,
  });

  getBmi(){
    if(bmi<16){
      return const Text('Severe Thinness',style:TextStyle(color: Colors.red,fontSize: 20.0));
    } else if(bmi>=16 && bmi<17){
      return const Text('Moderate Thinness',style:TextStyle(color: Colors.redAccent,fontSize: 18.0));
    }else if(bmi>=17 && bmi<18.5){
      return const Text('Mild Thinness',style:TextStyle(color: Colors.yellow,fontSize: 18.0));
    }else if(bmi>=18.5 && bmi<25){
      return const Text('Normal',style:TextStyle(color: Colors.green,fontSize: 16.0));
    }else if(bmi>=25 && bmi<30){
      return const Text('Overweight',style:TextStyle(color: Colors.yellow,fontSize: 18.0));
    }else if(bmi>=30 && bmi<35){
      return const Text('Obese Class I',style:TextStyle(color: Colors.redAccent,fontSize: 18.0));
    }else if(bmi>=35 && bmi<40){
      return const Text('Obese Class II',style:TextStyle(color: Colors.red,fontSize: 20.0));
    }
    else{
      return const Text('Obese Class III',style:TextStyle(color: Colors.red,fontSize: 20.0));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.purple,
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) {
              return FemaleScreen();
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
                headBar(text: 'Your Result'),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                getBmi()
                              ],
                            ),
                            Slider(
                              value: bmi,
                              max: 80.0,
                              min: 00.0,
                              onChanged: (double value) {},
                            ),
                            Text(
                              'Your BMI is ${bmi.toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.purple,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
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
        ),
      ),
    );

  }
}