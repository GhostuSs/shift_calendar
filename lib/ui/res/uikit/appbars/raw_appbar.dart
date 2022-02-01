import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../colors/colors.dart';

class RawAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? addBtn;
  final bool? backBtn;
  final double height;

  const RawAppBar(
      {Key? key,
      required this.title,
      this.addBtn,
      this.backBtn,
      required this.height})
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
                  ),
                  const Spacer(),
                  addBtn == true
                      ? Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: TextButton(
                            child: const Text(
                              'Save',
                              style: AppTypography.normal16Gray,
                            ),
                            onPressed: () {
                              print('saved');
                            },
                          ),
                        )
                      : Container()
                ],
              )
            ],
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height * 0.136);
}
