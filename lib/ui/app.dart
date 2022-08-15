import 'package:citelis/ui/intro_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../navigation/rotes.dart';

class MyApp extends StatelessWidget {
  final authController = Get.put(AuthController());
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      init: authController,
      builder: (_) {
        return const GetMaterialApp(
          title: 'Auth',
          onGenerateRoute: Routes.routes,
          //home: IntroScreen(),
        );
      },
    );
  }
}
