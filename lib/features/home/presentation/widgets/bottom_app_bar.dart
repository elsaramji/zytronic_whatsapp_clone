import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onItemTapped;
  const BottomBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
      backgroundColor: Theme.brightnessOf(context) == Brightness.light
          ? Colors.white
          : const Color(0xFF1F2C34),
      selectedItemColor: Colors.green,
      unselectedItemColor: Theme.brightnessOf(context) == Brightness.light
          ? Colors.grey
          : Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat_bubble_outline,
            size: 24.sp,
          ),
          label: "Chats",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.update, size: 24.sp),
          label: "Updates",
        ),
      ],
    );
  }
}
