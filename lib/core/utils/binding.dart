import 'package:e_commerce_os/Services/LocalUserData.dart';
import 'package:e_commerce_os/ViewModel/Auth_ViewModel.dart';
import 'package:e_commerce_os/ViewModel/Controller_ViewModle.dart';
import 'package:e_commerce_os/ViewModel/Home_View_model.dart';
import 'package:e_commerce_os/ViewModel/DBViewModel_And_Payment.dart';
import 'package:e_commerce_os/ViewModel/Profile_View_Model.dart';
import 'package:get/get.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => AuthViewModel(),
    );
    Get.lazyPut(
      () => ControllerViewModel(),
    );
    Get.lazyPut(
      () => HomeViewModel(),
    );
    Get.lazyPut(
      () => CashDataAndPayment(),
    );
    Get.lazyPut(
      () => LocalUserData(),
    );
    Get.lazyPut(
      () => ProfileViewModel(),
    );
    Get.lazyPut(
      () => LocalUserData(),
    );
  }
}
