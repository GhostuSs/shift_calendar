import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../../../data/screen_resolution.dart';
import '../../colors/colors.dart';

class OnboardingBtn extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const OnboardingBtn({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final Resolution size = context.read<Resolution>();
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width! * 0.1),
        child: Container(
          child: InkWell(
            borderRadius: BorderRadius.circular(size.height! * 0.03),
            onTap: onPressed,
            child: Container(
              width: double.infinity,
              height: size.height! * 0.0625,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size.height! * 0.03),
                  color: ProjectColors.white),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: AppTypography.normal18Black,
                    ),
                    SizedBox(
                      width: size.height! * 0.01,
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
        ));
  }
}
