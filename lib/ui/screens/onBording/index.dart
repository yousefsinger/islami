import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';

class Index extends StatelessWidget {
  final bool isActive;

  const Index({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      margin: EdgeInsets.symmetric(horizontal: 3),
      width: isActive ? 18 : 7,
      height: 7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isActive ? AppColors.primary : Colors.grey,
      ),
    );
  }
}
