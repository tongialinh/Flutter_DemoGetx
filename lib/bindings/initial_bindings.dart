import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:study_app/controllers/auth_controller.dart';

import 'package:study_app/controllers/question_papers/question_paper_controller.dart';
import 'package:study_app/controllers/theme_controller.dart';
import 'package:study_app/firebase_ref/references.dart';
import 'package:study_app/services/firebase_storage_service.dart';

class InitialBindings implements Bindings{

  @override
  void dependencies(){
    Get.put(ThemeController());
    Get.put(AuthController(), permanent: true);
    Get.lazyPut(() =>  FirebaseStorageService());


  }
}