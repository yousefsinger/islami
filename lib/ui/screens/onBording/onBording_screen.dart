import 'package:flutter/material.dart';
import 'package:islami/ui/screens/onBording/index.dart';
import 'package:islami/ui/screens/onBording/onBording_Page.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/asset_manager.dart';
import '../home/home.dart';
import 'onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  static const String routeName = "OnboardingScreen";

  OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<OnboardingData> onBordingList = [
    OnboardingData(
        title: "Welcome To Islmi App", image: "assets/images/onbording_1.png"),
    OnboardingData(
      title: "Welcome To Islmi",
      image: "assets/images/onbording_2.png",
      description: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingData(
      title: "Reading the Quran",
      image: "assets/images/onbording_3.png",
      description: "Read, and your Lord is the Most Generous",
    ),
    OnboardingData(
      title: "Bearish",
      image: "assets/images/onbording_4.png",
      description: "Praise the name of your Lord, the Most High",
    ),
    OnboardingData(
      title: "Holy Quran Radio",
      image: "assets/images/onbording_5.png",
      description:
          "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];

  PageController pageController = PageController();

  int sellectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      sellectedIndex = pageController.page?.toInt() ?? 0;
      setState(() {});
    });
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Image.asset(AssetsManager.islamiLogo),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemBuilder: (context, index) => onBordingPage(
                onboardingData: onBordingList[index],
              ),
              itemCount: onBordingList.length,
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (sellectedIndex != 0)
                      TextButton(
                        onPressed: () {
                          pageController.animateToPage(sellectedIndex - 1,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.fastOutSlowIn);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: AppColors.primary,
                          textStyle: AppStyles.primaryBold16,
                        ),
                        child: Text(
                          "Back",
                        ),
                      )
                    else
                      const SizedBox(),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          if (sellectedIndex == 4) {
                            _onBordingdDone();
                          } else {
                            pageController.animateToPage(sellectedIndex + 1,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.fastOutSlowIn);
                          }
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          foregroundColor: AppColors.primary,
                          textStyle: AppStyles.primaryBold16,
                        ),
                        child: Text(
                          sellectedIndex == 4 ? "Finish" : "Next",
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Index(isActive: sellectedIndex == 0),
                  Index(isActive: sellectedIndex == 1),
                  Index(isActive: sellectedIndex == 2),
                  Index(isActive: sellectedIndex == 3),
                  Index(isActive: sellectedIndex == 4),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  void _onBordingdDone() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setBool("firstTime", false);
    Navigator.pushNamed(context, Home.routeName);
  }
}
