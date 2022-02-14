import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';
import 'package:shift_calendar/ui/res/uikit/icon/raw_icon.dart';

import '../../../../data/templates_data.dart';
import '../../colors/colors.dart';

enum Type { usual, calendar }

class RawAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? addBtn;
  final bool? backBtn;
  final double height;
  final DateTime? selectedDay;
  final Type? appBarType;
  final void Function()? onPressed;

  const RawAppBar(
      {Key? key,
      required this.title,
      this.addBtn,
      this.backBtn,
      required this.height,
      this.onPressed,
      this.appBarType,
      this.selectedDay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      decoration: BoxDecoration(
          color: ProjectColors.black,
          border: Border.all(color: ProjectColors.black)),
      child: Padding(
          padding: const EdgeInsets.only(bottom: 18),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  backBtn == true
                      ? IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: ProjectColors.white,
                          ),
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
                  appBarType == Type.calendar
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: distributor(context),
                        )
                      : Container(),
                  addBtn == true
                      ? Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: TextButton(
                            child: const Text(
                              'Save',
                              style: AppTypography.normal16Gray,
                            ),
                            onPressed: onPressed ?? () => null,
                          ),
                        )
                      : Container()
                ],
              )
            ],
          )),
    );
  }

  List<Widget> distributor(BuildContext context) {
    final Templates prov = context.read<Templates>();
    List<Widget> data = [];

    for (int i = 0; i < prov.templates!.length; i++) {
      if (prov.templates![i].date?.day == selectedDay?.day &&
          prov.templates![i].date?.month == selectedDay?.month) {
        if (data.length < 4) {
          data.add(Padding(
            padding: const EdgeInsets.only(right: 5),
            child: RawIcon(
                size: 30, data: context.read<Templates>().templates![i]),
          ));
        } else {
          data.add(Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Container(
                width: 32,
                height: 32,
                child: Center(
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(
                        '+${prov.templates!.where((element) => element.date?.day == selectedDay?.day && element.date?.month == selectedDay?.month).length - 4}',
                        style: AppTypography.normal14White,
                      )),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: ProjectColors.darkGray),
              )));
        }
      }
    }
    return data;
  }

  @override
  Size get preferredSize => Size.fromHeight(height * 0.136);
}
