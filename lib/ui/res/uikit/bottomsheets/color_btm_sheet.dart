import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../../../data/screen_resolution.dart';
import '../../../../data/template_data.dart';

class ColorBtmSheet extends StatefulWidget {
  final void Function() notifyParent;
  final TemplateData templateData;

  const ColorBtmSheet({required this.notifyParent, required this.templateData});

  @override
  State<StatefulWidget> createState() {
    return _ColorBtmSheetState();
  }
}

class _ColorBtmSheetState extends State<ColorBtmSheet> {
  @override
  Widget build(BuildContext context) {
    final Resolution size = context.read<Resolution>();
    print(size.height);
    print(size.width);
    return SizedBox(
      height: size.height! * 0.3,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: size.height! * 0.02, horizontal: size.width! * 0.035),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: size.height! * 0.01, bottom: size.height! * 0.02),
              child: const Text(
                'Select color',
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
                      borderRadius: BorderRadius.circular(size.height! < 800
                          ? size.height! * 0.038
                          : size.height! * 0.033),
                      onTap: () => _onTap(ProjectColors.backgroundGray),
                      child: CircleAvatar(
                        radius: size.height! < 800
                            ? size.height! * 0.04
                            : size.height! < 800
                                ? size.height! * 0.038
                                : size.height! * 0.033,
                        backgroundColor: widget.templateData.color ==
                                ProjectColors.backgroundGray
                            ? ProjectColors.black
                            : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: size.height! < 800
                              ? size.height! * 0.038
                              : size.height! * 0.03,
                          backgroundColor: ProjectColors.backgroundGray,
                        ),
                      ),
                    )),
                Padding(
                  padding: EdgeInsets.only(left: size.width! * 0.02),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(size.height! < 800
                        ? size.height! * 0.038
                        : size.height! * 0.033),
                    onTap: () => _onTap(ProjectColors.amber),
                    child: CircleAvatar(
                        radius: size.height! < 800
                            ? size.height! * 0.04
                            : size.height! * 0.033,
                        backgroundColor:
                            widget.templateData.color == ProjectColors.amber
                                ? ProjectColors.black
                                : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: size.height! < 800
                              ? size.height! * 0.038
                              : size.height! * 0.03,
                          backgroundColor: ProjectColors.amber,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width! * 0.024),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(size.height! < 800
                        ? size.height! * 0.038
                        : size.height! * 0.033),
                    onTap: () => _onTap(ProjectColors.orange),
                    child: CircleAvatar(
                        radius: size.height! < 800
                            ? size.height! * 0.04
                            : size.height! * 0.033,
                        backgroundColor:
                            widget.templateData.color == ProjectColors.orange
                                ? ProjectColors.black
                                : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: size.height! < 800
                              ? size.height! * 0.038
                              : size.height! * 0.03,
                          backgroundColor: ProjectColors.orange,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width! * 0.024),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(size.height! < 800
                        ? size.height! * 0.038
                        : size.height! * 0.033),
                    onTap: () => _onTap(ProjectColors.coralRed),
                    child: CircleAvatar(
                        radius: size.height! < 800
                            ? size.height! * 0.04
                            : size.height! * 0.033,
                        backgroundColor:
                            widget.templateData.color == ProjectColors.coralRed
                                ? ProjectColors.black
                                : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: size.height! < 800
                              ? size.height! * 0.038
                              : size.height! * 0.03,
                          backgroundColor: ProjectColors.coralRed,
                        )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: size.width! * 0.024),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(size.height! < 800
                        ? size.height! * 0.038
                        : size.height! * 0.033),
                    onTap: () => _onTap(ProjectColors.purple),
                    child: CircleAvatar(
                        radius: size.height! < 800
                            ? size.height! * 0.04
                            : size.height! * 0.033,
                        backgroundColor:
                            widget.templateData.color == ProjectColors.purple
                                ? ProjectColors.black
                                : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: size.height! < 800
                              ? size.height! * 0.038
                              : size.height! * 0.03,
                          backgroundColor: ProjectColors.purple,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(left: size.width! * 0.024),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(size.height! < 800
                          ? size.height! * 0.04
                          : size.height! * 0.033),
                      onTap: () => _onTap(ProjectColors.lightGreen),
                      child: CircleAvatar(
                          radius: size.height! < 800
                              ? size.height! * 0.04
                              : size.height! * 0.033,
                          backgroundColor: widget.templateData.color ==
                                  ProjectColors.lightGreen
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: size.height! < 800
                                ? size.height! * 0.038
                                : size.height! * 0.03,
                            backgroundColor: ProjectColors.lightGreen,
                          )),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: size.width! * 0.024),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(size.height! < 800
                          ? size.height! * 0.038
                          : size.height! * 0.033),
                      onTap: () => _onTap(ProjectColors.darkGreen),
                      child: CircleAvatar(
                        radius: size.height! < 800
                            ? size.height! * 0.04
                            : size.height! * 0.033,
                        backgroundColor:
                            widget.templateData.color == ProjectColors.darkGreen
                                ? ProjectColors.black
                                : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: size.height! < 800
                              ? size.height! * 0.038
                              : size.height! * 0.03,
                          backgroundColor: ProjectColors.darkGreen,
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: size.width! * 0.024),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(size.height! < 800
                          ? size.height! * 0.038
                          : size.height! * 0.033),
                      onTap: () => _onTap(ProjectColors.lightBlue),
                      child: CircleAvatar(
                        radius: size.height! < 800
                            ? size.height! * 0.04
                            : size.height! * 0.033,
                        backgroundColor:
                            widget.templateData.color == ProjectColors.lightBlue
                                ? ProjectColors.black
                                : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: size.height! < 800
                              ? size.height! * 0.038
                              : size.height! * 0.03,
                          backgroundColor: ProjectColors.lightBlue,
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: size.width! * 0.024),
                    child: CircleAvatar(
                      radius: size.height! < 800
                          ? size.height! * 0.04
                          : size.height! * 0.033,
                      backgroundColor:
                          widget.templateData.color == ProjectColors.darkBlue
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(size.height! < 800
                            ? size.height! * 0.038
                            : size.height! * 0.033),
                        onTap: () => _onTap(ProjectColors.darkBlue),
                        child: CircleAvatar(
                          radius: size.height! < 800
                              ? size.height! * 0.038
                              : size.height! * 0.03,
                          backgroundColor: ProjectColors.darkBlue,
                        ),
                      ),
                    )),
                Padding(
                    padding: EdgeInsets.only(left: size.width! * 0.024),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(size.height! < 800
                          ? size.height! * 0.04
                          : size.height! * 0.033),
                      onTap: () => _onTap(ProjectColors.black),
                      child: CircleAvatar(
                        radius: size.height! < 800
                            ? size.height! * 0.037
                            : size.height! * 0.033,
                        backgroundColor:
                            widget.templateData.color == ProjectColors.black
                                ? ProjectColors.black
                                : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: size.height! < 800
                              ? size.height! * 0.038
                              : size.height! * 0.03,
                          backgroundColor: ProjectColors.darkGray,
                        ),
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }

  _onTap(Color value) {
    setState(() {
      widget.templateData.color = value;
    });
    widget.notifyParent();
  }
}
