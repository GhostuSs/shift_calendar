import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../../../data/screen_resolution.dart';
import '../../../../data/template_data.dart';
import '../../images/icons.dart';

class IconBtmSheet extends StatefulWidget {
  final void Function() notifyParent;
  final TemplateData templateData;

  const IconBtmSheet({required this.notifyParent, required this.templateData});

  @override
  State<StatefulWidget> createState() {
    return _IconBtmSheetState();
  }
}

class _IconBtmSheetState extends State<IconBtmSheet> {
  @override
  Widget build(BuildContext context) {
    final Resolution size = context.read<Resolution>();
    print(size.width);
    print(size.height);
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height! * 0.02, horizontal: size.width! * 0.035),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height! * 0.01, bottom: size.height! * 0.02),
              child: const Text(
                'Select icon',
                style: AppTypography.regular18Black,
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: size.width! * 0.02),
                    child: InkWell(
                        borderRadius:
                            BorderRadius.circular(size.height! * 0.03),
                        onTap: () => _onTap(0),
                        child: CircleAvatar(
                          radius: size.height! < 600
                              ? size.height! * 0.04
                              : size.height! * 0.033,
                          backgroundColor: widget.templateData.iconIndex == 0
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: size.height! < 600
                                ? size.height! * 0.035
                                : size.height! * 0.03,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.sun),
                          ),
                        ))),
                Padding(
                  padding: EdgeInsets.only(left: size.width! * 0.02),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(size.height! * 0.03),
                      splashColor: ProjectColors.darkGray,
                      onTap: () => _onTap(1),
                      child: CircleAvatar(
                          radius: size.height! < 600
                              ? size.height! * 0.04
                              : size.height! * 0.033,
                          backgroundColor: widget.templateData.iconIndex == 1
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: size.height! < 600
                                ? size.height! * 0.035
                                : size.height! * 0.03,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.moon),
                          ))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width! * 0.02),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(size.height! * 0.03),
                      splashColor: ProjectColors.darkGray,
                      onTap: () => _onTap(2),
                      child: CircleAvatar(
                          radius: size.height! < 600
                              ? size.height! * 0.04
                              : size.height! * 0.033,
                          backgroundColor: widget.templateData.iconIndex == 2
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: size.height! < 600
                                ? size.height! * 0.035
                                : size.height! * 0.03,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.home),
                          ))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width! * 0.02),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(size.height! * 0.03),
                      splashColor: ProjectColors.darkGray,
                      onTap: () => _onTap(3),
                      child: CircleAvatar(
                          radius: size.height! < 600
                              ? size.height! * 0.04
                              : size.height! * 0.033,
                          backgroundColor: widget.templateData.iconIndex == 3
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: size.height! < 600
                                ? size.height! * 0.035
                                : size.height! * 0.03,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: const Icon(
                              Icons.favorite,
                              color: ProjectColors.black,
                            ),
                          ))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width! * 0.02),
                  child: InkWell(
                      onTap: () => _onTap(4),
                      borderRadius: BorderRadius.circular(size.height! * 0.03),
                      splashColor: ProjectColors.darkGray,
                      child: CircleAvatar(
                          radius: size.height! < 600
                              ? size.height! * 0.04
                              : size.height! * 0.033,
                          backgroundColor: widget.templateData.iconIndex == 4
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: size.height! < 600
                                ? size.height! * 0.035
                                : size.height! * 0.03,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.wallet),
                          ))),
                ),
              ],
            ),
            SizedBox(
              height: size.height! * 0.01,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: size.width! * 0.02),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(size.height! * 0.03),
                      splashColor: ProjectColors.darkGray,
                      child: CircleAvatar(
                          radius: size.height! < 600
                              ? size.height! * 0.04
                              : size.height! * 0.033,
                          backgroundColor: widget.templateData.iconIndex == 5
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: size.height! < 600
                                ? size.height! * 0.035
                                : size.height! * 0.03,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.attention),
                          )),
                      onTap: () => _onTap(5),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: size.width! * 0.02),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(size.height! * 0.03),
                      splashColor: ProjectColors.darkGray,
                      onTap: () => _onTap(6),
                      child: CircleAvatar(
                          radius: size.height! < 600
                              ? size.height! * 0.04
                              : size.height! * 0.033,
                          backgroundColor: widget.templateData.iconIndex == 6
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: size.height! < 600
                                ? size.height! * 0.035
                                : size.height! * 0.03,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.calendar),
                          ))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width! * 0.02),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(size.height! * 0.03),
                      splashColor: ProjectColors.darkGray,
                      onTap: () => _onTap(7),
                      child: CircleAvatar(
                          radius: size.height! < 600
                              ? size.height! * 0.04
                              : size.height! * 0.033,
                          backgroundColor: widget.templateData.iconIndex == 7
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: size.height! < 600
                                ? size.height! * 0.035
                                : size.height! * 0.03,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.star),
                          ))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width! * 0.02),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(size.height! * 0.03),
                      splashColor: ProjectColors.darkGray,
                      onTap: () => _onTap(8),
                      child: CircleAvatar(
                          radius: size.height! < 600
                              ? size.height! * 0.04
                              : size.height! * 0.033,
                          backgroundColor: widget.templateData.iconIndex == 8
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: size.height! < 600
                                ? size.height! * 0.035
                                : size.height! * 0.03,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.time),
                          ))),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width! * 0.02),
                  child: InkWell(
                      onTap: () => _onTap(9),
                      borderRadius: BorderRadius.circular(size.height! * 0.03),
                      splashColor: ProjectColors.darkGray,
                      child: CircleAvatar(
                          radius: size.height! < 600
                              ? size.height! * 0.04
                              : size.height! * 0.033,
                          backgroundColor: widget.templateData.iconIndex == 9
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: size.height! < 600
                                ? size.height! * 0.035
                                : size.height! * 0.03,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.people),
                          ))),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTap(int index) {
    setState(() {
      widget.templateData.iconIndex = index;
    });
    widget.notifyParent();
  }
}
