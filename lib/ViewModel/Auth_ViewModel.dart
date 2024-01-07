// ignore_for_file: unused_field

import 'package:e_commerce_os/Models/UserModel.dart';
import 'package:e_commerce_os/Screens/Home_Viwe.dart';
import 'package:e_commerce_os/Services/FireStore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String name;

  Rx<User?> _user = Rx<User?>(null);
  String? get user => _user.value?.email;
  

  void googleSignInFun() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(authCredential).then((myUser) async {
        await FireSoterUser().addUserToFireStore(
          UserModel(
            name: name,
            email: myUser.user!.email!,
            userId: myUser.user!.uid,
            pic: "",
          ),
        );
      });
      Get.offAll(HomeView());
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        title: e.toString(),
        message: e.toString(),
      ));
      print(e);
    }
  }

  void signInWithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        animationDuration: Duration(seconds: 2),
        title: email.toString(),
        message: password.toString(),
      ));
      Get.offAll(HomeView());
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        animationDuration: Duration(seconds: 2),
        title: e.toString(),
        message: e.toString(),
      ));
      print(e);
    }
  }

  void signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((myUser) async {
        await FireSoterUser().addUserToFireStore(
          UserModel(
            name: name,
            email: myUser.user!.email!,
            userId: myUser.user!.uid,
            pic: "",
          ),
        );
      });
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        animationDuration: Duration(seconds: 2),
        title: email.toString(),
        message: password.toString(),
      ));
      Get.offAll(HomeView());
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        animationDuration: Duration(seconds: 2),
        title: e.toString(),
        message: e.toString(),
      ));
      print(e);
    }
  }
}
