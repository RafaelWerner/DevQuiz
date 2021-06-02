import 'package:flutter/cupertino.dart';

class ChallengeController {
  final currentQuestionNumberNotifier = ValueNotifier<int>(1);
  int get currentQuestionNumber => currentQuestionNumberNotifier.value;
  set currentQuestionNumber(int value) =>
      currentQuestionNumberNotifier.value = value;
}
