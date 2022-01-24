import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../colors/colors.dart';

class OnboardingBtn extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const OnboardingBtn({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 64),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ProjectColors.white),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: AppTypography.normal18Black,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: ProjectColors.black,
                  size: 18,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
