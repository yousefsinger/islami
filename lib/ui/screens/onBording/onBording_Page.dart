import 'package:flutter/material.dart';
import 'package:islami/ui/screens/onBording/onboarding_data.dart';
import 'package:islami/ui/utils/app_styles.dart';

class onBordingPage extends StatelessWidget {
  final OnboardingData onboardingData;

  const onBordingPage({required this.onboardingData, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(child: Image.asset(onboardingData.image)),
          SizedBox(
            height: 16,
          ),
          Text(
            onboardingData.title,
            style: AppStyles.primaryBold24,
          ),
          SizedBox(
            height: 16,
          ),
          if (onboardingData.description != null)
            Text(
              onboardingData.description!,
              textAlign: TextAlign.center,
              style: AppStyles.primaryBold20,
            ),
        ],
      ),
    );
  }
}
