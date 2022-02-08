import 'package:flutter/material.dart';
import 'package:shift_calendar/ui/res/typography/app_typography.dart';
import 'package:shift_calendar/ui/res/uikit/buttons/onboarding_btn.dart';
import 'package:shift_calendar/ui/screens/onboarding/model/onboarding_model.dart';

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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 52),
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
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 56),
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
