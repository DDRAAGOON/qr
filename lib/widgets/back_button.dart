import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(17.w, 12.h, 16.w, 40.h),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: 42.w,
          height: 42.w,
          decoration: const BoxDecoration(
            color: darkGreen,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.chevron_left, color: white, size: 26.r),
        ),
      ),
    );
  }
}
