import 'package:e_commerce_os/Models/UserModel.dart';
import 'package:e_commerce_os/Services/LocalUserData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getCurrentUSer();
  }

  final LocalUserData localUserData = Get.find();
  UserModel get userModel => _userModel;
  late UserModel _userModel;

  Future signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localUserData.deleteUser();
  }

  Future getCurrentUSer() async {
    // await LocalUserData().getUser.then(
    // (value) => _userModel = value!,
    // );
    _userModel = (await LocalUserData().getUser)!;
    update();
  }
}
