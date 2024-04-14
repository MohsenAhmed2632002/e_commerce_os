import 'package:e_commerce_os/ViewModel/Auth_ViewModel.dart';
import 'package:e_commerce_os/ViewModel/ControllerView.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

// ignore: must_be_immutable
class RegisterView extends GetWidget<AuthViewModel> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            child: Center(
              child: Container(
                height: MediaQuery.sizeOf(context).height * .7,
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.all(15),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Sign Up",
                          style: getBoldTextStyle(Colors.black, fontSize: 24),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Your Name";
                          }
                        },
                        onChanged: (value) {
                          controller.name = value;
                        },
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 234, 0),
                            ),
                          ),
                          label: Text(
                            "Name",
                            style: getRegulerTextStyle(Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Your Email";
                          }
                        },
                        onChanged: (value) {
                          controller.email = value;
                        },
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 234, 0),
                            ),
                          ),
                          label: Text(
                            "E-mail",
                            style: getRegulerTextStyle(Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter Your PassWord";
                          }
                        },
                        onChanged: (value) {
                          controller.password = value;
                        },
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 234, 0),
                            ),
                          ),
                          label: Text(
                            "PassWord",
                            style: getRegulerTextStyle(Colors.black),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget The Pass?",
                            style: getRegulerTextStyle(Colors.black87),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButtonsignUpWithEmailAndPassword(formkey: formkey, controller: controller),
                    ],
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

class ElevatedButtonsignUpWithEmailAndPassword extends StatelessWidget {
  const ElevatedButtonsignUpWithEmailAndPassword({
    super.key,
    required this.formkey,
    required this.controller,
  });

  final GlobalKey<FormState> formkey;
  final AuthViewModel controller;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStatePropertyAll<Size>(
          Size(
            MediaQuery.sizeOf(context).width,
            MediaQuery.sizeOf(context).height * .09,
          ),
        ),
        backgroundColor: MaterialStatePropertyAll(
          Color.fromARGB(255, 255, 234, 0),
        ),
      ),
      onPressed: () {
        formkey.currentState!.save();
        if (formkey.currentState!.validate()) {
          try {
            controller.signUpWithEmailAndPassword();
           
          } on Exception catch (e) {
            print(e);
          }
        }
      },
      child: Text(
        "Sign Up",
        style: getMediumTextStyle(Colors.black),
      ),
    );
  }
}
