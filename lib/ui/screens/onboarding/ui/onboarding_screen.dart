import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';
import 'package:shift_calendar/ui/res/uikit/buttons/onboarding_btn.dart';
import 'package:shift_calendar/ui/screens/onboarding/model/onboarding_model.dart';

import '../../../../data/screen_resolution.dart';
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
    final Resolution size = context.read<Resolution>();
    size.set(
        MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return Scaffold(
      backgroundColor: ProjectColors.darkGray,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: size.height! * 0.05),
              child: OnboardingBtn(
                  label: 'Continue',
                  onPressed: () {
                    if (currentIndex < OnBoardingImages.dataList.length - 1) {
                      currentIndex++;
                      pageController.animateToPage(currentIndex,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.linear);
                    } else {
                      Navigator.pushNamed(context, '/');
                    }
                  }),
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: 50, right: 50, bottom: size.height! * 0.05),
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
      ),
      body: PageView.builder(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage(OnBoardingImages.dataList[currentIndex]),
                        fit: BoxFit.cover)),
              )),
    );
  }
}
