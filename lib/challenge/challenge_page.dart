import 'package:devquiz/challenge/challenge_controller.dart';
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
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    controller.currentQuestionNumberNotifier.addListener(() {
      setState(() {});
    });
    pageController.addListener(() {
      controller.currentQuestionNumber = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(106),
          child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currentQuestionNumberNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    questionNumber: value,
                    questionsLength: widget.questions.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children:
              widget.questions.map((e) => QuizWidget(question: e)).toList(),
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                NextButtonWidget.white(
                  label: "Pular",
                  onTap: () {
                    pageController.nextPage(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.linear);
                  },
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
