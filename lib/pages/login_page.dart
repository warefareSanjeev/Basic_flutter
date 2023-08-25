// import 'dart:js_interop';

// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

// ignore: use_key_in_widget_constructors
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeBUtton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        // whenerver we want to chaneg the state we use setState()
        changeBUtton = true;
      });
      await Future.delayed(Duration(
          seconds: 1)); //await means wait for 2s and the go to the next page
      await Navigator.pushNamed(context, MyRotes.HomeRoute);
      setState(() {
        changeBUtton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          //add scrrol button to adjust according to its size

          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // children to use more than one widget
                Image.asset(
                  // to add image
                  "assets/images/hey.png",
                  fit: BoxFit.cover,
                  //sets layout of the the image
                ),
                SizedBox(
                  // to add container so that it can look good
                  height: 20.0,
                ),
                Text(
                  "Instagram  $name",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 32.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          labelText: "username",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "enter username";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          labelText: "password",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return " enter password";
                          } else if (value.length < 8) {
                            return "password length less than 8.";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Colors.purple,
                        borderRadius:
                            BorderRadius.circular(changeBUtton ? 50 : 8),
                        child: InkWell(
                          onTap: () => moveToHome(context),
                          child: AnimatedContainer(
                            //Animated Conatinner to some animaton
                            duration:
                                Duration(seconds: 1), //Duration of Animation
                            // container cannot be used as a button as compared to elevated button we can use inkwell
                            height: 40,
                            width: changeBUtton ? 50 : 120,
                            alignment: Alignment.center,
                            child: changeBUtton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),

                            // shape: changeBUtton
                            //     ? BoxShape.circle
                            // : BoxShape.rectangle,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
