import 'package:e_commerce_os/Models/CartProdectModel.dart';
import 'package:e_commerce_os/ViewModel/ControllerView.dart';
import 'package:e_commerce_os/core/Constans/theme.dart';
import 'package:e_commerce_os/core/utils/binding.dart';
import 'package:e_commerce_os/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Hive.initFlutter();
Hive.registerAdapter(CartProductModelAdapter());

  await Hive.openBox<List<CartProductModel>>("CartBox");
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
 
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
      theme: getAppTheme(),
    );
  }
}
