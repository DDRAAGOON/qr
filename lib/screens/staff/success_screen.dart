import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: darkGreen,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: white, size: 20.r),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Process Successful',
          style: TextStyle(
            color: white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80.h),
              
              // Success Icon
              Container(
                width: 150.w,
                height: 150.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFC8E6C9),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    Icons.check_circle_outline,
                    color: darkGreen,
                    size: 100.r,
                  ),
                ),
              ),
              
              SizedBox(height: 40.h),
              
              Text(
                'Approval Successful',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkGreen,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: 16.h),
              
              Text(
                'The ticket has been successfully validated and attendance is registered.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: gray,
                  fontSize: 16.sp,
                  height: 1.5,
                ),
              ),
              
              SizedBox(height: 60.h),
              
              // Ticket Details Card
              Container(
                padding: EdgeInsets.all(20.r),
                decoration: BoxDecoration(
                  color: bgColor.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(color: darkGreen.withValues(alpha: 0.2)),
                ),
                child: Column(
                  children: [
                    _buildDetailRow('Ticket ID', '#QR-849520'),
                    const Divider(),
                    _buildDetailRow('Match', 'Al Ahly vs Zamalek'),
                    const Divider(),
                    _buildDetailRow('Time', '10:30 PM'),
                  ],
                ),
              ),
              
              SizedBox(height: 60.h),
              
              // Action Button
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkGreen,
                    foregroundColor: white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Back To Home',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: gray, fontSize: 14.sp),
          ),
          Text(
            value,
            style: TextStyle(
              color: black,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
