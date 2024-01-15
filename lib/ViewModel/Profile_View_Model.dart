import 'package:e_commerce_os/Services/LocalUserData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalUserData localUserData = Get.find();
  Future signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localUserData.deleteUser();
  }
}
