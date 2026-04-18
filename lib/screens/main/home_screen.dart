import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';
import '../../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
        children: [
          // ── Hero Image Section ──────────────────────────────────
          ClipRRect(
            child: SizedBox(
              height: 383.h,
              width: 432.w,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Stadium background
                  Image.asset(
                    'assets/image/stadium.png',
                    fit: BoxFit.cover,
                  ),

                  // QR TICKET text — top left
                  Positioned(
                    top: 60.h,
                    left: 28.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),

                  // Football player — right side
                  Positioned(
                    child: Image.asset(
                      'assets/image/football.png',
                      fit: BoxFit.none,  // تحافظ على الحجم الأصلي للصورة
                    ),
                  ),

                  // Football ball — bottom left
                ],
              ),
            ),
          ),

          const SizedBox(height: 50),

          // ── Sport Buttons ───────────────────────────────────────
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  _SportButton(
                    label: 'FOOTBALL',
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.footballMatches,
                    ),
                  ),
                  SizedBox(height: 55.h),

                  // Subtitle
                  Text(
                    '- ENJOY EVERY MOMENT -',
                    style: TextStyle(
                      color: darkGreen,
                      fontSize: 15.sp,
                      letterSpacing: 2.5.w,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
      // ── Bottom Nav ──────────────────────────────────────────────
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}

// ── Reusable Sport Button ─────────────────────────────────────────
class _SportButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SportButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: darkGreen,
          foregroundColor: white,
          padding: EdgeInsets.symmetric(vertical: 18.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.w,
          ),
        ),
      ),
    );
  }
}