import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

import 'package:devquiz/shared/models/answer_model.dart';

class MyAnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final VoidCallback onTap;
  final bool isSelected;

  MyAnswerWidget({
    Key? key,
    required this.answer,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.lightBlue : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(
              BorderSide(color: isSelected ? AppColors.blue : AppColors.border),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  answer.title,
                  style:
                      isSelected ? AppTextStyles.bodyDark : AppTextStyles.body,
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.darkBlue : AppColors.white,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.fromBorderSide(
                    BorderSide(
                        color: isSelected
                            ? AppColors.lightBlue
                            : AppColors.border),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
