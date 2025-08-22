import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'WhatsApp',
      ),
      actions: [
        IconButton(
            icon: Icon(
              Icons.camera_alt_outlined,
              size: 16.sp,
            ),
            onPressed: () {}),
        IconButton(
            icon: Icon(
              Icons.more_vert,
              size: 16.sp,
            ),
            onPressed: () {}),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(46.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
          child: TextFormField(
              decoration: InputDecoration(
            hintText: "Ask Meta AI or Search",
          )),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(1.sw, 86.h);
}
