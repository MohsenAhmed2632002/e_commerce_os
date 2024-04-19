import 'package:e_commerce_os/Models/UserModel.dart';
import 'package:e_commerce_os/Services/LocalUserData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel extends GetxController {
  final LocalUserData localUserData = Get.find();
  UserModel get userModel => _userModel;
  UserModel _userModel = UserModel(
    email: "",
    name: "",
    pic: "",
    userId: "",
  ); // تهيئة _userModel بقيمة افتراضية null

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  Future signOut() async {
    GoogleSignIn().signOut();
    FirebaseAuth.instance.signOut();
    localUserData.deleteUser();
  }

  Future<void> getCurrentUser() async {
    _userModel = (await localUserData.getUser)!;
    update();
  }
}
