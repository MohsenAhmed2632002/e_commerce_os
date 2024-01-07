import 'package:e_commerce_os/core/Constans/theme.dart';
import 'package:e_commerce_os/core/utils/binding.dart';
import 'package:e_commerce_os/firebase_options.dart';
import 'package:e_commerce_os/Screens/ControllerView.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
