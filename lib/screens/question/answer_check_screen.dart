import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/custom_text_styles.dart';
import 'package:study_app/controllers/question_papers/questions_controller.dart';
import 'package:study_app/widgets/common/custom_app_bar.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({Key? key}) : super(key: key);
   static String routeName = "/answerchechscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        titleWidget: Obx(
            ()=>Text(
              'Question ${(controller.questionIndex.value+1).toString()
              .padLeft(2, "0")}',
              style: appBarTS,
            )
        ),
      ),
    );
  }
}
