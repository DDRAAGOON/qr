import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/colors.dart';

AppBar adminGreenAppBar(String title, BuildContext context,
    {List<Widget>? actions}) {
  return AppBar(
    backgroundColor: darkGreen,
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.chevron_left, color: white, size: 28.r),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(title,
        style: TextStyle(
            color: white, fontSize: 18.sp, fontWeight: FontWeight.bold)),
    actions: actions,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20.r),
        bottomRight: Radius.circular(20.r),
      ),
    ),
  );
}

InputDecoration adminPillDec({required IconData icon, required String hint, Widget? suffix}) {
  return InputDecoration(
    prefixIcon: Icon(icon, color: darkGreen, size: 18.r),
    suffixIcon: suffix,
    hintText: hint,
    hintStyle: TextStyle(color: darkGreen, fontSize: 13.sp),
    filled: true,
    fillColor: white,
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
    enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: BorderSide(color: darkGreen, width: 1.4.w)),
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: BorderSide(color: darkGreen, width: 2.w)),
  );
}

Widget adminGreenSaveBtn(String label, VoidCallback onTap) => SizedBox(
      width: 180.w,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: darkGreen,
          foregroundColor: white,
          padding: EdgeInsets.symmetric(vertical: 14.h),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          elevation: 0,
        ),
        child: Text(label,
            style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
      ),
    );
