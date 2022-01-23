import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../colors/colors.dart';

class RawAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? addBtn;
  final bool? backBtn;

  const RawAppBar({Key? key, required this.title, this.addBtn, this.backBtn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: ProjectColors.black,
      child: Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  backBtn == true
                      ? IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () => Navigator.pop(context),
                        )
                      : Container(),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Text(
                      title,
                      style: AppTypography.semibold32White,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(126);
}
