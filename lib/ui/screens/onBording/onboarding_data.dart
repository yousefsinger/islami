import 'package:flutter/material.dart';

class OnboardingData extends StatelessWidget {
  final String title;
  final String? description;
  final String image;

   OnboardingData({
    super.key,
    required this.title,
    this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

      ],
    );
  }
}
