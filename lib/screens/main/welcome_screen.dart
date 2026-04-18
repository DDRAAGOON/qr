import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Stack(
        children: [
          // ── Football Ball Top Right ─────────────────────────────
          Positioned(
            top: 30.h,
            right: -30.w,
            child: Image.asset(
              'assets/image/ballu.png',
              width: 100.w,
              height: 97.h,
            ),
          ),

          // ── Football Ball Bottom Left ───────────────────────────
          Positioned(
            bottom: -17.h,
            left: -50.w,
            child: Image.asset(
              'assets/image/image.png',
              width: 205.w,
              height: 205.w,
            ),
          ),

          // ── Main Content ────────────────────────────────────────
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── Green Header Card ─────────────────────────────
                Container(
                  margin: EdgeInsets.fromLTRB(10.w, 60.h, 10.w, 80.h),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  decoration: BoxDecoration(
                    color: darkGreen,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Center(
                    child: Text(
                      'QR Ticket',
                      style: TextStyle(
                        fontSize: 45.sp,
                        fontWeight: FontWeight.bold,
                        color: white,
                        letterSpacing: 2.w,
                      ),
                    ),
                  ),
                ),

                const Spacer(),

                // ── Buttons ───────────────────────────────────────
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      // LOG IN
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, '/login'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkGreen,
                            foregroundColor: white,
                            padding: EdgeInsets.symmetric(vertical: 18.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 36.h),

                      // CREATE ACCOUNT
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pushNamed(context, '/signup'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkGreen,
                            foregroundColor: white,
                            padding: EdgeInsets.symmetric(vertical: 18.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'CREATE ACCOUNT',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 44.h),

                      // ENJOY EVERY MOMENT
                      Text(
                        '- ENJOY EVERY MOMENT -',
                        style: TextStyle(
                          color: darkGreen,
                          fontSize: 12.sp,
                          letterSpacing: 2.5.w,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}