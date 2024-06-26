import 'package:e_commerce_os/Models/CartProdectModel.dart';
import 'package:e_commerce_os/ViewModel/ControllerView.dart';
import 'package:e_commerce_os/ViewModel/DBViewModel_And_Payment.dart';
import 'package:e_commerce_os/core/Constans/theme.dart';
import 'package:e_commerce_os/core/utils/binding.dart';
import 'package:e_commerce_os/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  await BeforeRunApp();
  // DevicePreview(
  //   enabled: true,
  //   builder: (context) => MyApp(),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      home: ControllerView(),
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(context: context),
    );
  }
}

Future<void> BeforeRunApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51P5NxpRvDErjFj2ZbWmCKc8ytmzyK9kRNgb9zHQKJSzRtfKDIf42bxFsV7w4KPPluoCE1zxkefEVUdJsyHpkC3zL00Sprh2Kht";
  await Hive.initFlutter();
  Hive.registerAdapter(CartProductModelAdapter());

  await Hive.openBox<List<CartProductModel>>("CartBox");

  Get.put(CashDataAndPayment());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}
