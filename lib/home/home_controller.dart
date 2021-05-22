import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    user = UserModel(
      name: "Rafael",
      photoUrl: "",
    );

    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = [
      QuizModel(
          title: "NLW 5 Flutter",
          questionAnswered: 1,
          questions: [
            QuestionModel(
              title: "Está curtindo o Flutter?",
              answers: [
                AnswerModel(title: "Sim."),
                AnswerModel(title: "Sim, mas o professor é muito confuso."),
                AnswerModel(title: "Não."),
                AnswerModel(title: "Todas as respostas a cima.", isRight: true)
              ],
            ),
            QuestionModel(
              title: "Está curtindo o Flutter?",
              answers: [
                AnswerModel(title: "Sim."),
                AnswerModel(title: "Sim, mas o professor é muito confuso."),
                AnswerModel(title: "Não."),
                AnswerModel(title: "Todas as respostas a cima.", isRight: true)
              ],
            ),
          ],
          image: AppImages.blocks,
          level: Level.facil)
    ];
    state = HomeState.success;
  }
}
