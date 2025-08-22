// widget to display story progress bar
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryProgressBar extends StatelessWidget {
  final AnimationController animationController;
  final bool isActive;
  final bool isCompleted;

  const StoryProgressBar({
    super.key,
    required this.animationController,
    required this.isActive,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 3.h,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(2.r),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (isCompleted) {
            return Container(color: Colors.white); // شريط مكتمل
          }
          if (isActive) {
            // بناء الشريط المتحرك باستخدام AnimatedBuilder
            return AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: constraints.maxWidth * animationController.value,
                    color: Colors.white,
                  ),
                );
              },
            );
          }
          return const SizedBox.shrink(); // شريط فارغ
        },
      ),
    );
  }
}
