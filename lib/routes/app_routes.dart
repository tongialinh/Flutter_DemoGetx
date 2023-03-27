import 'package:flutter/material.dart';

import 'package:study_app/controllers/question_papers/question_paper_controller.dart';
import 'package:study_app/controllers/zoom_drawer_controller.dart';

import 'package:study_app/screens/home/home_screen.dart';

import 'package:study_app/screens/introduction/introduction.dart';
import 'package:study_app/screens/splash/splash_screen.dart';
import 'package:get/get.dart';


class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => const SplashScreen()),
        GetPage(
            name: "/introduction", page: () => const AppIntroductionScreen()),
    GetPage(
        name: "/home",
        page: () => const HomeScreen(),
        binding: BindingsBuilder(() {
          Get.put(QuestionPaperController());
          Get.put(MyZoomDrawerController());
        })),
      ];
}
