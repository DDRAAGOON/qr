import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';
import '../../widgets/bottom_nav.dart';

class FootballDetailScreen extends StatelessWidget {
  final Map<String, dynamic>? match;

  const FootballDetailScreen({super.key, this.match});

  static const double categoryLabelShiftRight = 35;

  /// حجم زر Cat3 (قلّل الأرقام عشان الزر يصغر — الشكل نفسه).
  static const double categoryButtonHorizontalPadding = 40;  // ✅ زودتها عشان التناسق
  static const double categoryButtonVerticalPadding = 8;    // ✅ زودتها عشان التناسق
  static const double categoryButtonIconSize = 41;           // ✅ قللتها شوية
  static const double categoryButtonIconTextGap = 20;        // ✅ قللتها عشان المسافة
  static const double categoryButtonFontSize = 16;           // ✅ زودتها شوية
  static const double categoryButtonBorderRadius = 8;       // ✅ زودتها
  static const double categoryButtonsVerticalGap = 14;       // ✅ زودت المسافة بين الزرارين

  /// مسافات كتلة Cat3 + السعر من حواف الشاشة.
  static const double categorySectionPaddingLeft = 80;
  static const double categorySectionPaddingTop = 44;
  static const double categorySectionPaddingRight = 30;
  static const double categorySectionPaddingBottom = 50;

  static const Color matchTimeColor = black;

  @override
  Widget build(BuildContext context) {
    final String team1 =
        match?['team1'] as String? ?? 'assets/teamfootball/Al_Ahly.png';
    final String team2 =
        match?['team2'] as String? ?? 'assets/teamfootball/Zamalek.png';
    final String date = match?['date'] as String? ?? '21 June 2026';
    final String time = match?['time'] as String? ?? '21:00';
    const String price = '75.00 EGP';

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
            ),
            SizedBox(height: 8.h),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.w),
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: lightGreen,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    team1,
                    width: 64.w,
                    height: 64.w,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.sports_soccer,
                      color: white,
                      size: 48.r,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Nile 2026',
                        style: TextStyle(
                          color: gray,
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        date,
                        style: TextStyle(
                          color: darkGreen,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        'KICK OFF',
                        style: TextStyle(
                          color: black,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.w,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        time,
                        style: TextStyle(
                          color: matchTimeColor,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    team2,
                    width: 64.w,
                    height: 64.w,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.sports_soccer,
                      color: white,
                      size: 48.r,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                categorySectionPaddingLeft.w,
                categorySectionPaddingTop.h,
                categorySectionPaddingRight.w,
                categorySectionPaddingBottom.h,
              ),
              child: Column(
                children: [
                  _CategoryButton(
                    label: 'Cat3 - Left',
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.payment,
                      arguments: {
                        'seat': 'Cat3 - Left',
                        'amount': price,
                      },
                    ),
                    textShiftRight: categoryLabelShiftRight.w,
                  ),
                  SizedBox(height: categoryButtonsVerticalGap.h),
                  _CategoryButton(
                    label: 'Cat3 - Right',
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.payment,
                      arguments: {
                        'seat': 'Cat3 - Right',
                        'amount': price,
                      },
                    ),
                    textShiftRight: categoryLabelShiftRight.w,
                  ),
                  SizedBox(height: 13.h),

                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.payment,
                      arguments: {
                        'seat': 'Selected ticket',
                        'amount': price,
                      },
                    ),
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 12.h),
                      decoration: BoxDecoration(
                        color: darkGreen,
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/icons/money.png',
                            width: 28.w,
                            height: 20.h,
                            color: white,
                          ),
                          SizedBox(width: 12.w),
                          Text(
                            'Price',
                            style: TextStyle(
                              color: white,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Text(
                            price,
                            style: TextStyle(
                              color: white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Image.asset(
                'assets/studio/football.png',
                width: 294.w,
                height: 171.h,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double textShiftRight;

  const _CategoryButton({
    required this.label,
    required this.onTap,
    this.textShiftRight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: FootballDetailScreen.categoryButtonHorizontalPadding.w,
          vertical: FootballDetailScreen.categoryButtonVerticalPadding.h,
        ),
        decoration: BoxDecoration(
          color: darkGreen,
          borderRadius: BorderRadius.circular(
            FootballDetailScreen.categoryButtonBorderRadius.r,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/seat.png',
              width: FootballDetailScreen.categoryButtonIconSize.r,
              height: FootballDetailScreen.categoryButtonIconSize.r,
              color: white,
            ),
            SizedBox(width: FootballDetailScreen.categoryButtonIconTextGap.w),
            Padding(
              padding: EdgeInsets.only(left: textShiftRight),
              child: Text(
                label,
                style: TextStyle(
                  color: white,
                  fontSize: FootballDetailScreen.categoryButtonFontSize.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}