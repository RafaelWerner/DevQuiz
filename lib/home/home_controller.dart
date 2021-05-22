import 'package:devquiz/core/app_images.dart';
import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/shared/models/answer_model.dart';
import 'package:devquiz/shared/models/question_model.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';

class HomeController {
  HomeState state = HomeState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() {
    user = UserModel(
      name: "Rafael",
      photoUrl: "https://avatars.githubusercontent.com/u/21970648?v=4",
    );
  }

  void getQuizzes() {
    quizzes = [
      QuizModel(
          title: "NLW 5 Flutter",
          questions: [
            QuestionModel(
              title: "Está curtindo o Flutter?",
              answers: [
                AnswerModel(title: "Sim."),
                AnswerModel(title: "Sim, mas o professor é muito confuso."),
                AnswerModel(title: "Não."),
                AnswerModel(title: "Todas as respostas a cima.", isRight: true)
              ],
            )
          ],
          image: AppImages.blocks,
          level: Level.facil)
    ];
  }
}
