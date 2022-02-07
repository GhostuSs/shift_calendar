import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../../../data/template_data.dart';
import '../../images/icons.dart';

class IconBtmSheet extends StatefulWidget {
  final void Function() notifyParent;

  const IconBtmSheet({required this.notifyParent});

  @override
  State<StatefulWidget> createState() {
    return _IconBtmSheetState();
  }
}

class _IconBtmSheetState extends State<IconBtmSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                'Select icon',
                style: AppTypography.regular18Black,
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () => _onTap(0),
                        child: CircleAvatar(
                          radius: 32,
                          backgroundColor:
                              context.read<TemplateData>().iconIndex == 0
                                  ? ProjectColors.black
                                  : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.sun),
                          ),
                        ))),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: ProjectColors.darkGray,
                      onTap: () => _onTap(1),
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor:
                              context.read<TemplateData>().iconIndex == 1
                                  ? ProjectColors.black
                                  : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.moon),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: ProjectColors.darkGray,
                      onTap: () => _onTap(2),
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor:
                              context.read<TemplateData>().iconIndex == 2
                                  ? ProjectColors.black
                                  : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.home),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: ProjectColors.darkGray,
                      onTap: () => _onTap(3),
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor:
                              context.read<TemplateData>().iconIndex == 3
                                  ? ProjectColors.black
                                  : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Icon(
                              Icons.favorite,
                              color: ProjectColors.black,
                            ),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                      onTap: () => _onTap(4),
                      borderRadius: BorderRadius.circular(30),
                      splashColor: ProjectColors.darkGray,
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor:
                              context.read<TemplateData>().iconIndex == 4
                                  ? ProjectColors.black
                                  : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.wallet),
                          ))),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: ProjectColors.darkGray,
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor:
                              context.read<TemplateData>().iconIndex == 5
                                  ? ProjectColors.black
                                  : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.attention),
                          )),
                      onTap: () => _onTap(5),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: ProjectColors.darkGray,
                      onTap: () => _onTap(6),
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor:
                              context.read<TemplateData>().iconIndex == 6
                                  ? ProjectColors.black
                                  : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.calendar),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: ProjectColors.darkGray,
                      onTap: () => _onTap(7),
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor:
                              context.read<TemplateData>().iconIndex == 7
                                  ? ProjectColors.black
                                  : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.star),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                      borderRadius: BorderRadius.circular(30),
                      splashColor: ProjectColors.darkGray,
                      onTap: () => _onTap(8),
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor:
                              context.read<TemplateData>().iconIndex == 8
                                  ? ProjectColors.black
                                  : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: ProjectColors.backgroundGray,
                            child: Image.asset(AppIcons.time),
                          ))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                      onTap: () => _onTap(9),
                      borderRadius: BorderRadius.circular(30),
                      splashColor: ProjectColors.darkGray,
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor:
                              context.read<TemplateData>().iconIndex == 9
                                  ? ProjectColors.black
                                  : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: 30,
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
      context.read<TemplateData>().iconIndex = index;
    });
    widget.notifyParent();
  }
}
