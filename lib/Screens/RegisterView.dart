import 'package:e_commerce_os/ViewModel/Auth_ViewModel.dart';
import 'package:e_commerce_os/core/Constans/Font.dart';
import 'package:e_commerce_os/core/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: lightColorScheme.onPrimary,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: lightColorScheme.primary,
                ),
                color: lightColorScheme.onPrimary.withOpacity(.7),
              ),
              height: MediaQuery.sizeOf(context).height * .6,
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
                        label: Text("Name"),
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
                        label: Text("E-mail"),
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
                        label: Text("PassWord"),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Forget The Pass?"),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStatePropertyAll<Size>(
                          Size(
                            MediaQuery.sizeOf(context).width,
                            MediaQuery.sizeOf(context).height * .09,
                          ),
                        ),
                        backgroundColor: MaterialStatePropertyAll(
                          lightColorScheme.primary,
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
                        style: getMediumTextStyle(lightColorScheme.onPrimary),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
