import 'package:flutter/material.dart';

import 'package:devquiz/core/app_text_styles.dart';
import 'package:devquiz/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int questionNumber;
  final int questionsLength;

  const QuestionIndicatorWidget({
    Key? key,
    required this.questionNumber,
    required this.questionsLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão $questionNumber",
                style: AppTextStyles.body,
              ),
              Text(
                "de $questionsLength",
                style: AppTextStyles.body,
              )
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value: questionNumber / questionsLength),
        ],
      ),
    );
  }
}
