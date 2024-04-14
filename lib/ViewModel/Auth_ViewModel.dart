// ignore_for_file: unused_field

import 'package:e_commerce_os/Models/UserModel.dart';
import 'package:e_commerce_os/Services/FireStore.dart';
import 'package:e_commerce_os/Services/LocalUserData.dart';
import 'package:e_commerce_os/ViewModel/ControllerView.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController {
  final LocalUserData localUserData = Get.find();

  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["email"]);
  FirebaseAuth _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  late String name;

  Rx<User?> _user = Rx<User?>(null);
  String? get user => _user.value?.email;
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  void googleSignInFun() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      await _auth.signInWithCredential(authCredential).then((myUser) async {
        await saveUser(myUser);
      });
      Get.offAll(ControllerView());
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
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await FireSoterUser().getCurrentUser(value.user!.uid).then((value) =>
            setUser(UserModel.fromJson(value.data() as Map<String, dynamic>)));
      });
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        animationDuration: Duration(seconds: 2),
        title: email.toString(),
        message: password.toString(),
      ));
      Get.offAll(ControllerView());
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
        await saveUser(myUser);
      });
      Get.showSnackbar(GetSnackBar(
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        animationDuration: Duration(seconds: 2),
        title: email.toString(),
        message: password.toString(),
      ));
      Get.offAll(ControllerView());
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

  Future<void> saveUser(UserCredential myUser) async {
    UserModel userModel = UserModel(
      name: name,
      email: myUser.user!.email!,
      userId: myUser.user!.uid,
      pic: "",
    );
    await FireSoterUser().addUserToFireStore(userModel);
    setUser(userModel);
  }

  Future setUser(UserModel userModel) async {
    await localUserData.setuserData(userModel);
  }
}
