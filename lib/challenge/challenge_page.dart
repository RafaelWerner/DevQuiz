import 'package:flutter/material.dart';

import 'package:devquiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:devquiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:devquiz/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  ChallengePage({
    Key? key,
    required this.questions,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(88),
          child: SafeArea(
            top: true,
            child: QuestionIndicatorWidget(),
          ),
        ),
        body: QuizWidget(
          question: widget.questions[0],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NextButtonWidget.white(
                  label: "Pular",
                  onTap: () {},
                ),
                SizedBox(
                  width: 7,
                ),
                NextButtonWidget.green(
                  label: "Confirmar",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
