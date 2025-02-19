import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_styles.dart';
import 'package:islami/ui/utils/asset_manager.dart';

class Sebha extends StatefulWidget {
  const Sebha({super.key});

  @override
  SebhaAnimation createState() => SebhaAnimation();
}

class SebhaAnimation extends State<Sebha> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> _rotationAnimation;
  double currentAngle = 0.0;
  final double rotationStep = pi / 20;

  final List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "لا إله إلا الله",
    "الله أكبر",
    "لا حول ولا قوة إلا بالله",
  ];
  int currentIndex = 0;
  int counter = 1;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _rotationAnimation = Tween<double>(begin: 0, end: rotationStep).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeInOut),
    );
  }

  void onTap() {
    if (controller.isAnimating) return;

    setState(() {
      if (counter < 30) {
        counter++;
      } else {
        counter = 1;
        currentIndex = (currentIndex + 1) % azkar.length;
      }
    });

    controller.forward(from: 0).then((_) {
      setState(() {
        currentAngle += rotationStep;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: currentAngle + _rotationAnimation.value,
                  child: Image.asset(AssetsManager.sebha),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      azkar[currentIndex],
                      style: AppStyles.whiteBold30,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      '$counter',
                      style: AppStyles.whiteBold30,
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
