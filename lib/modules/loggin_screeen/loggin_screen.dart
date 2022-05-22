import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../main_page/main_page.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usernameInputData = TextEditingController();
  var passwordInputData = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Loggin',
          style: TextStyle(
            color: Colors.purple,
            fontSize: 20.0,
          ),
        ),
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          foemfieldWidget(
                            isPassword: false,
                            prefix: Icons.email,
                            labeltext: 'Email Address',
                            maxline: 1,
                            InputData: usernameInputData,
                            textInputType: TextInputType.emailAddress,
                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'please enter a valid email address'
                                    .toUpperCase();
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          foemfieldWidget(
                            isPassword: isPassword,
                            prefix: Icons.lock,
                            //suffix: !isPassword ? Icons.visibility:Icons.visibility_off,
                            labeltext: 'Password',
                            maxline: 1,
                            InputData: passwordInputData,
                            textInputType: TextInputType.visiblePassword,

                            validate: (String value) {
                              if (value.isEmpty) {
                                return 'Please enter a valid password'
                                    .toUpperCase();
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: 20.0),
                          actionButton(
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return MainPage();
                                  }));
                                }
                              },
                              text: 'Loggin'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
