
import 'package:flutter/material.dart';
import 'package:bmi_calculator/main.dart';

import '../../shared/components/components.dart';
import '../female_screen/female_screen.dart';
import '../male_screen/male_screen.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.purple,
          onPressed: () {
            Navigator.pop(context, MaterialPageRoute(builder: (context) {
              return const MyApp();
            }));
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: const Text(
          'Calculate Your BMI',
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
                headBar(text: 'Choose One'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: isMale ? Colors.deepPurple[100] : Colors.white,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Image(
                                      image:
                                          AssetImage('assets/images/male.png')),
                                  Text(
                                    'Male',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isMale = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: !isMale ? Colors.deepPurple[100] : Colors.white,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Image(
                                      image:
                                          AssetImage('assets/images/female.png')),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontSize: 20.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                actionButton(function: (){
                  if(isMale){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MaleScreen();
                    }));
                  }else{
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return FemaleScreen();
                    }));
                  }
                }, text: 'next', ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
