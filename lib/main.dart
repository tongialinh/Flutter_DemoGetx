import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:study_app/bindings/initial_bindings.dart';
import 'package:study_app/configs/themes/app_dark_theme.dart';
import 'package:study_app/controllers/theme_controller.dart';
import 'package:study_app/data_uploader_screen.dart';
import 'package:get/get.dart';
import 'package:study_app/firebase_options.dart';

import 'package:study_app/screens/introduction/introduction.dart';
import 'package:study_app/routes/app_routes.dart';
import 'package:study_app/screens/splash/splash_screen.dart';
import 'package:study_app/configs/themes/app_light_theme.dart';

/*void main(){
  WidgetsFlutterBinding.ensureInitialized();
  InitialBindings().dependencies();
  runApp(const MyApp());
}*/
class MyApp extends StatelessWidget{
  const MyApp ({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
  return GetMaterialApp(
    theme: Get.find<ThemeController>().lightTheme,
   // home: HomePage()
    getPages: AppRoutes.routes(),
  );
  }

}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  InitialBindings().dependencies();
  runApp(const MyApp());
  //runApp(GetMaterialApp(home: DataUploaderScreen()));
}

