import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';
import 'scan_qr_screen.dart';

class ScanTicketScreen extends StatelessWidget {
  const ScanTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: darkGreen,
        elevation: 0,
        title: Text('Scan Ticket',
            style: TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 18.sp)),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: white),
            onPressed: () =>
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (_) => false),
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r), bottomRight: Radius.circular(20.r)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            // Dashboard label
            Row(
              children: [
                Icon(Icons.menu, color: darkGreen, size: 20.r),
                SizedBox(width: 8.w),
                Text('Dashboard',
                    style: TextStyle(
                        color: darkGreen,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            SizedBox(height: 40.h),

            // QR Card
            Center(
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => const ScanQRScreen())),
                child: Container(
                  width: 180.w,
                  height: 180.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD4EDDA),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/image/qr_code.png',
                      width: 120.w,
                      height: 120.w,
                      errorBuilder: (_, __, ___) => Icon(
                          Icons.qr_code, size: 100.r, color: Colors.black87),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.h),

            Center(
              child: Text('Scan QR Code',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
            ),
            Center(
              child: Text('Tap to scan tickets',
                  style: TextStyle(color: Colors.grey, fontSize: 14.sp)),
            ),

            SizedBox(height: 40.h),

            // Total Tickets Today
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              decoration: BoxDecoration(
                border: Border.all(color: darkGreen, width: 1.5.w),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: Row(
                children: [
                  Container(
                    width: 44.w,
                    height: 44.w,
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4EDDA),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Icon(Icons.local_activity, color: darkGreen, size: 24.r),
                  ),
                  SizedBox(width: 14.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Total Tickets Today',
                            style: TextStyle(
                                fontSize: 15.sp, fontWeight: FontWeight.w600)),
                        Text('Tickets',
                            style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                      ],
                    ),
                  ),
                  Text('620',
                      style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
