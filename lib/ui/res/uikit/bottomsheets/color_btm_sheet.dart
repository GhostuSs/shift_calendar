import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/ui/res/colors/colors.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';

import '../../../../data/template_data.dart';

class ColorBtmSheet extends StatefulWidget {
  final void Function() notifyParent;

  const ColorBtmSheet({required this.notifyParent});

  @override
  State<StatefulWidget> createState() {
    return _ColorBtmSheetState();
  }
}

class _ColorBtmSheetState extends State<ColorBtmSheet> {
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
                'Select color',
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
                      borderRadius: BorderRadius.circular(32),
                      onTap: () => _onTap(ProjectColors.backgroundGray),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: context.read<TemplateData>().color ==
                                ProjectColors.backgroundGray
                            ? ProjectColors.black
                            : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: ProjectColors.backgroundGray,
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(32),
                    onTap: () => _onTap(ProjectColors.amber),
                    child: CircleAvatar(
                        radius: 32,
                        backgroundColor: context.read<TemplateData>().color ==
                                ProjectColors.amber
                            ? ProjectColors.black
                            : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: ProjectColors.amber,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(32),
                    onTap: () => _onTap(ProjectColors.orange),
                    child: CircleAvatar(
                        radius: 32,
                        backgroundColor: context.read<TemplateData>().color ==
                                ProjectColors.orange
                            ? ProjectColors.black
                            : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: ProjectColors.orange,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(32),
                    onTap: () => _onTap(ProjectColors.coralRed),
                    child: CircleAvatar(
                        radius: 32,
                        backgroundColor: context.read<TemplateData>().color ==
                                ProjectColors.coralRed
                            ? ProjectColors.black
                            : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: ProjectColors.coralRed,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(32),
                    onTap: () => _onTap(ProjectColors.purple),
                    child: CircleAvatar(
                        radius: 32,
                        backgroundColor: context.read<TemplateData>().color ==
                                ProjectColors.purple
                            ? ProjectColors.black
                            : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: ProjectColors.purple,
                        )),
                  ),
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
                      borderRadius: BorderRadius.circular(32),
                      onTap: () => _onTap(ProjectColors.lightGreen),
                      child: CircleAvatar(
                          radius: 32,
                          backgroundColor: context.read<TemplateData>().color ==
                                  ProjectColors.lightGreen
                              ? ProjectColors.black
                              : ProjectColors.lightGray,
                          child: CircleAvatar(
                            radius: 30,
                            backgroundColor: ProjectColors.lightGreen,
                          )),
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(32),
                      onTap: () => _onTap(ProjectColors.darkGreen),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: context.read<TemplateData>().color ==
                                ProjectColors.darkGreen
                            ? ProjectColors.black
                            : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: ProjectColors.darkGreen,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(32),
                      onTap: () => _onTap(ProjectColors.lightBlue),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: context.read<TemplateData>().color ==
                                ProjectColors.lightBlue
                            ? ProjectColors.black
                            : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: ProjectColors.lightBlue,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundColor: context.read<TemplateData>().color ==
                              ProjectColors.darkBlue
                          ? ProjectColors.black
                          : ProjectColors.lightGray,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(32),
                        onTap: () => _onTap(ProjectColors.darkBlue),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: ProjectColors.darkBlue,
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(32),
                      onTap: () => _onTap(ProjectColors.black),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundColor: context.read<TemplateData>().color ==
                                ProjectColors.black
                            ? ProjectColors.black
                            : ProjectColors.lightGray,
                        child: CircleAvatar(
                          radius: 30,
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
      context.read<TemplateData>().color = value;
    });
    widget.notifyParent();
  }
}
