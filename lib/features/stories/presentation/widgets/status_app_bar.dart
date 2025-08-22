
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class StausAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StausAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        'Updates',
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
          child: Row(
            children: [
              Text(
                "Status",
                style: GoogleFonts.roboto(
                    fontSize: 16.sp, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(1.sw, 86.h);
}
