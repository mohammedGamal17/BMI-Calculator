import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import '../../shared/components/components.dart';
import '../main_page/main_page.dart';
import '../male_result/male_result.dart';

class MaleScreen extends StatefulWidget {
  const MaleScreen({Key? key}) : super(key: key);

  @override
  State<MaleScreen> createState() => _MaleScreenState();
}

class _MaleScreenState extends State<MaleScreen> {
  double height = 160.0;
  double weight = 70.0;
  double bmi = 0.0;

  // ignore: empty_constructor_bodies
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
      ),
      body: SafeArea(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                headBar(text:'Your Height And Widget'),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //height
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
                        //image
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage('assets/images/male.png'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        //weight
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
                                'Weight',
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
                  child: actionButton(text: 'next', function:(){
                    bmi = weight / pow((height / 100), 2);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MaleResult(bmi: bmi,)
                        ));
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
