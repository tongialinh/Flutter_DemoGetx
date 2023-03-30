import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_app/configs/themes/app_colors.dart';
import 'package:study_app/configs/themes/custom_text_styles.dart';
import 'package:study_app/configs/themes/ui_parameters.dart';
import 'package:study_app/controllers/question_papers/questions_controller.dart';
import 'package:study_app/firebase_ref/loading_status.dart';
import 'package:study_app/widgets/common/background_decoration.dart';
import 'package:study_app/widgets/common/main_button.dart';
import 'package:study_app/widgets/common/question_place_holder.dart';
import 'package:study_app/widgets/content_area.dart';
import 'package:study_app/widgets/questions/answer_card.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({Key? key}) : super(key: key);
  static const String routeName = "/questionsscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecoration(
          child: Obx(() => Column(
                children: [
                  if (controller.loadingStatus.value == LoadingStatus.loading)
                    const Expanded(
                        child: ContentArea(child: QuestionScreenHolder())),
                  if (controller.loadingStatus.value == LoadingStatus.completed)
                    Expanded(
                        child: ContentArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(top: 25),
                        child: Column(
                          children: [
                            Text(
                              controller.currentQuestion.value!.question,
                              style: questionTS,
                            ),
                            GetBuilder<QuestionsController>(
                                id: 'answers_list',
                                builder: (context) {
                              return ListView.separated(
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(top: 25),
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    final answer = controller
                                        .currentQuestion.value!.answers[index];
                                    return AnswerCard(
                                      answer:
                                          '${answer.identifier}. ${answer.answer}',
                                      onTap: () {
                                        controller
                                            .selectedAnswer(answer.identifier);
                                      },
                                      isSelected: answer.identifier ==
                                          controller.currentQuestion.value!
                                              .selectedAnswer,
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          const SizedBox(
                                            height: 10,
                                          ),
                                  itemCount: controller
                                      .currentQuestion.value!.answers.length);
                            }),
                            ColoredBox(
                                color: Theme.of(context).scaffoldBackgroundColor,
                            child: Padding(
                              padding: UIParamenters.mobileScreenPadding,
                              child: Row(
                                children: [
                                  Visibility(
                                    visible: controller.isFirstQuestion,
                                      child: SizedBox(
                                        width: 55,
                                        height: 55,
                                        child: MainButton(
                                          onTap: (){

                                          },
                                          child: Icon(
                                            Icons.arrow_back_ios_new,
                                            color: Get.isDarkMode?onSurfaceTextColor:Theme.of(context).primaryColor,
                                          )
                                        ),

                                  ))
                                ],
                              ),
                            ),)
                          ],
                        ),
                      ),
                    ))
                ],
              ))),
    );
  }
}
