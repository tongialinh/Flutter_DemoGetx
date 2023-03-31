import 'package:study_app/controllers/question_papers/questions_controller.dart';

extension QuestionsControllerExtension on QuestionsController{

  int get correctQuestionCount => allQuestions
      .where((element) => element.selectedAnswer== element.correctAnswer)
      .toList()
      .length;

  String get correctAnsweredQuestions{
    return '$correctQuestionCount out of ${allQuestions.length} are correct';
  }

  String get points{
    var points = (correctQuestionCount/allQuestions.length)*100*
      (questionPaperModel.timeSeconds - remainSeconds)/questionPaperModel.timeSeconds*100;
    return points.toStringAsFixed(2);
  }

}