import 'package:flutter/cupertino.dart';
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
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return subscribe == false && seen == true
        ? Scaffold(
            backgroundColor: const Color(0xFF151515),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                      subscribe = false;
                    },
                  ),
                ),
                Spacer(),
                OnboardingBtn(
                    label: 'Continue',
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('subscribe', true);
                      await prefs.setBool("seen", true);
                      Navigator.pushNamed(context, '/');
                    }),
                SizedBox(
                  height: 35.w,
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 51.w, right: 51.w, bottom: 56.h),
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
      body: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              filterQuality: FilterQuality.high,
                              image: Svg(
                                OnBoardingImages.dataList[3],
                                scale: 6.0,
                                source: SvgSource.asset,
                              ),
                              fit: BoxFit.cover)),
                    )),
          )
        : Scaffold(
            backgroundColor: const Color(0xFF151515),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Column(
              mainAxisSize: MainAxisSize.min,
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
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                            subscribe = false;
                          },
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
                        }
                      }
                      if (currentIndex < OnBoardingImages.dataList.length - 1) {
                        if (currentIndex == 2) setState(() {});
                        currentIndex++;
                        pageController.animateToPage(currentIndex,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.linear);
                      } else {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setBool("seen", true);
                        Navigator.pushNamed(context, '/');
                      }
                    }),
                SizedBox(
                  height: 35.w,
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 51.w, right: 51.w, bottom: 56.h),
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
            body: PageView.builder(
                controller: pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              filterQuality: FilterQuality.high,
                              image: Svg(
                                OnBoardingImages.dataList[currentIndex],
                                scale: 6.0,
                                source: SvgSource.asset,
                              ),
                              fit: BoxFit.cover)),
                    )),
          );
  }
}
