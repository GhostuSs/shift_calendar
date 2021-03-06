import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';
import 'package:shift_calendar/ui/res/uikit/buttons/onboarding_btn.dart';
import 'package:shift_calendar/ui/screens/onboarding/model/onboarding_model.dart';
import 'package:shift_calendar/ui/screens/onboarding/ui/uikit/rating_dialog.dart';

import '../../../../main.dart';
import '../../../res/colors/colors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _OnBoardingScreenState();
  }
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return subscribe == false && seen == true
        ? WillPopScope(
            onWillPop: () async => false,
            child: Scaffold(
              drawerEnableOpenDragGesture: false,
              endDrawerEnableOpenDragGesture: false,
              drawerDragStartBehavior: DragStartBehavior.down,
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0xFF151515),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 65.h, right: 16.w),
                    child: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: ProjectColors.lightGray.withOpacity(0.2),
                        size: 30,
                      ),
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool('subscribe', false);
                        await prefs.setBool('seen', true);
                        seen = true;
                        subscribe = false;
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 40.h),
                    child: OnboardingBtn(
                        label: 'Continue',
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool('subscribe', true);
                          subscribe = true;
                          await prefs.setBool("seen", true);
                          seen = true;
                          Navigator.pushNamed(context, '/');
                        }),
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 51.w, right: 51.w, bottom: 60.h),
                      child: Opacity(
                        opacity: 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Terms of Use',
                              style: AppTypography.normal14GreyUnderlined,
                            ),
                            Text(
                              'Restore',
                              style: AppTypography.normal14GreyUnderlined,
                            ),
                            Text(
                              'Privacy policy',
                              style: AppTypography.normal14GreyUnderlined,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              body: IgnorePointer(
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          filterQuality: FilterQuality.high,
                          image: Svg(
                            OnBoardingImages.dataList[3],
                            scale: 6.0,
                            source: SvgSource.asset,
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
            ))
        : WillPopScope(
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: const Color(0xFF151515),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  currentIndex == 3
                      ? Padding(
                          padding: EdgeInsets.only(top: 65.h, right: 16.w),
                          child: IconButton(
                            icon: Icon(
                              Icons.clear,
                              color: ProjectColors.lightGray.withOpacity(0.2),
                              size: 30,
                            ),
                            onPressed: () async {
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              subscribe = false;
                              prefs.setBool('subscribe', false);
                              prefs.setBool('seen', true);
                              seen = true;
                              Navigator.pushNamed(context, '/');
                            },
                          ),
                        )
                      : Container(),
                  currentIndex == 1
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height > 800
                                  ? 200.h
                                  : 80.h),
                          child: Center(
                            child: Image.asset('assets/icons/illustration.png'),
                          ),
                        )
                      : Container(),
                  Spacer(),
                  OnboardingBtn(
                      label: 'Continue',
                      onPressed: () async {
                        if (currentIndex == 1) {
                          await showCupertinoDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  const RateMyApp());
                          if (currentIndex == 3) {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setBool('subscribe', true);
                            prefs.setBool("seen", true);
                            subscribe = true;
                            seen = true;
                          }
                        }
                        if (currentIndex <
                            OnBoardingImages.dataList.length - 1) {
                          currentIndex++;
                          if (currentIndex == 2 ||
                              currentIndex == 1 ||
                              currentIndex == 3) {
                            setState(() {});
                          }
                        } else {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          await prefs.setBool("seen", true);
                          Navigator.pushNamed(context, '/');
                        }
                      }),
                  SizedBox(
                    height: 35.h,
                  ),
                  Padding(
                      padding: EdgeInsets.only(
                          left: 51.w,
                          right: 51.w,
                          bottom: MediaQuery.of(context).size.height > 800
                              ? 20.h
                              : 30.h),
                      child: Opacity(
                        opacity: 0.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Terms of Use',
                              style: AppTypography.normal14GreyUnderlined,
                            ),
                            Text(
                              'Restore',
                              style: AppTypography.normal14GreyUnderlined,
                            ),
                            Text(
                              'Privacy policy',
                              style: AppTypography.normal14GreyUnderlined,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
              body: IgnorePointer(
                ignoringSemantics: true,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          filterQuality: FilterQuality.high,
                          image: Svg(
                            MediaQuery.of(context).size.height > 800
                                ? OnBoardingImages2.dataList[currentIndex]
                                : OnBoardingImages.dataList[currentIndex],
                            scale: 8.0,
                            source: SvgSource.asset,
                          ),
                          fit: BoxFit.cover)),
                ),
              ),
            ),
            onWillPop: () async => false);
  }
}
