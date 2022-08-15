import 'package:citelis/repository/auth_repository.dart';
import 'package:citelis/repository/implementarions/auth_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'ui/app.dart';

void main() async {
  WidgetsFlutterBinding();
  Get.testMode = true;
  await Firebase.initializeApp();
  Get.put<AuthRepository>(AuthRepositoryImp());

  runApp(MyApp());
}
