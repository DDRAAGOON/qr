import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';

class ScanTicketScreen extends StatelessWidget {
  const ScanTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: darkGreen,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Scan Ticket',
          style: TextStyle(
            color: white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.all(0),
          child: Image.asset(
            'assets/image/ball.png',
            width: 60,
            height: 60,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: white, size: 24.r),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoutes.login, (route) => false);
            },
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dashboard Section
          Padding(
            padding: EdgeInsets.all(24.r),
            child: Row(
              children: [
                Icon(Icons.list, color: darkGreen, size: 24.r),
                SizedBox(width: 8.w),
                Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // QR Code Scan Area
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.staffScanner);
                  },
                  child: Container(
                    padding: EdgeInsets.all(30.r),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB5FFAE).withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Container(
                      width: 180.w,
                      height: 160.w,
                      padding: EdgeInsets.all(20.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Image.asset(
                        'assets/image/QRCode.png',
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.qr_code_scanner,
                          size: 115.r,
                          color: darkGreen,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text(
                  'Scan QR Code',
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  'Tap to scan tickets',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: gray,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(flex: 2),

          // Stats Card
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(color: darkGreen, width: 1.5.w),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50.w,
                    height: 50.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB5FFAE),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(Icons.confirmation_number_outlined,
                        color: darkGreen, size: 28.r),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Tickets Today',
                          style: TextStyle(
                            fontSize: 19.sp,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                        ),
                        Text(
                          'Tickets',
                          style: TextStyle(
                            fontSize: 17.sp,
                            color: gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '142',
                    style: TextStyle(
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
