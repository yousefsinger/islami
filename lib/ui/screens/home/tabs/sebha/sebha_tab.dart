import 'package:flutter/material.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/asset_manager.dart';
import 'sebha_view.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(AssetsManager.sebha_Background),
              fit: BoxFit.fill)),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColors.black.withOpacity(0.7),
          AppColors.black.withOpacity(0.8),
          AppColors.black,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: [
            Image.asset(AssetsManager.islamiLogo),
            Text(
              "سَبِّحِ اسْمَ رَبِّكَ الأعلى ",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
                child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Row(),
                Image.asset(
                  AssetsManager.sebhaHead,
                  height: MediaQuery.of(context).size.height * .14,
                ),
                Center(child: Sebha()),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
