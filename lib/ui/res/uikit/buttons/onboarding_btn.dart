import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../colors/colors.dart';

class OnboardingBtn extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const OnboardingBtn({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 64.w),
        child: InkWell(
          borderRadius: BorderRadius.circular(30.h),
          onTap: onPressed,
          child: Container(
            width: 247.w,
            height: 56.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.h),
                color: ProjectColors.white),
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style: AppTypography.normal18Black
                        .copyWith(fontSize: 15.h, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: ProjectColors.black,
                    size: 12.h,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
