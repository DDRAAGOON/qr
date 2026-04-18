import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';
import '../../widgets/admin_shared_widgets.dart';

class ProcessFailedScreen extends StatelessWidget {
  const ProcessFailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: adminGreenAppBar('Process Failed', context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            SizedBox(height: 32.h),

            // Red exclamation circle
            Container(
              width: 72.w,
              height: 72.w,
              decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
              child: Icon(Icons.priority_high, color: white, size: 44.r),
            ),
            SizedBox(height: 20.h),

            Text(
              'Attendance Registration\nFailed',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.red, fontSize: 22.sp, fontWeight: FontWeight.bold, height: 1.3),
            ),
            SizedBox(height: 12.h),

            Text(
              'Your attendance cannot be registered at this time, please check your internet connection.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 13.sp, height: 1.5),
            ),
            SizedBox(height: 28.h),

            Align(
              alignment: Alignment.centerLeft,
              child: Text('Error Details',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 12.h),

            _DetailCard(label: 'Error Message', value: 'Error syncing data with the server'),
            SizedBox(height: 12.h),
            _DetailCard(label: 'Date and Time', value: '2026-01-24 19:45:12'),
            SizedBox(height: 12.h),
            _StatusCard(label: 'Status', value: 'Incomplete', isSuccess: false),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamedAndRemoveUntil(context, AppRoutes.home, (_) => false),
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkGreen,
                  foregroundColor: white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                  elevation: 0,
                ),
                child: Text('Back To Home',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade600,
                  foregroundColor: white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                  elevation: 0,
                ),
                child: Text('Try Again',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}

class _DetailCard extends StatelessWidget {
  final String label;
  final String value;
  const _DetailCard({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
          SizedBox(height: 4.h),
          Text(value,
              style: TextStyle(
                  fontSize: 15.sp, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class _StatusCard extends StatelessWidget {
  final String label;
  final String value;
  final bool isSuccess;
  const _StatusCard(
      {required this.label, required this.value, required this.isSuccess});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
          SizedBox(height: 6.h),
          Row(
            children: [
              Icon(Icons.circle,
                  size: 10.r, color: isSuccess ? darkGreen : Colors.red),
              SizedBox(width: 8.w),
              Text(value,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: isSuccess ? Colors.black : Colors.red)),
            ],
          ),
        ],
      ),
    );
  }
}
