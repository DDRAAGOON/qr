import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';
import '../../widgets/bottom_nav.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({
    super.key,
    this.totalAmount = '75.00 EGP',
  });

  final String totalAmount;

  static const String transferPhoneNumber = '01011945474';

  double get _amountValue {
    final m = RegExp(r'[\d.]+').firstMatch(totalAmount);
    if (m == null) return 75;
    return double.tryParse(m.group(0)!) ?? 75;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 34.h),
              Container(
                width: double.infinity,
                padding:
                    EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                decoration: BoxDecoration(
                  border: Border.all(color: black, width: 1.5.w),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 4.h,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: black, width: 1.5.w),
                              borderRadius: BorderRadius.circular(6.r),
                              color: const Color(0xffE4DFDF)),
                          child: Text(
                            '${_amountValue.toStringAsFixed(0)} EGP',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28.h),
              Text(
                'You can transfer using any of\nfollowing methods',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: black,
                  height: 1.4,
                ),
              ),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _PaymentLogo(
                    imagePath: 'assets/payment/vodafone.png',
                    isCircle: true,
                    bgColor: Color(0xFFEEEEEE),
                  ),
                  _PaymentLogo(
                    imagePath: 'assets/payment/instapay.png',
                    isCircle: true,
                    bgColor: Color(0xFF6B2D8B),
                  ),
                  _PaymentLogo(
                    imagePath: 'assets/payment/orange.png',
                    isCircle: false,
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _PaymentLogo(
                    imagePath: 'assets/payment/fawry.png',
                    isCircle: false,
                    width: 130.w,
                    height: 52.h,
                  ),
                  _PaymentLogo(
                    imagePath: 'assets/payment/ea.png',
                    isCircle: false,
                    width: 130.w,
                    height: 52.h,
                  ),
                ],
              ),
              SizedBox(height: 28.h),
              Text(
                transferPhoneNumber,
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w500,
                  color: black,
                  letterSpacing: 1.w,
                ),
              ),
              SizedBox(height: 12.h),
              SizedBox(
                width: 160.w,
                child: ElevatedButton(
                  onPressed: () {
                    Clipboard.setData(
                      const ClipboardData(text: transferPhoneNumber),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Phone number copied'),
                        backgroundColor: darkGreen,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkGreen,
                    foregroundColor: white,
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Copy',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.paymentUpload);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkGreen,
                    foregroundColor: white,
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Upload Screenshot',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.qrTicket),
                child: Text(
                  'I completed payment — show ticket',
                  style: TextStyle(
                    color: darkGreen,
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              SizedBox(height: 12.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}

class _PaymentLogo extends StatelessWidget {
  const _PaymentLogo({
    required this.imagePath,
    required this.isCircle,
    this.bgColor,
    this.width = 80,
    this.height = 80,
  });

  final String imagePath;
  final bool isCircle;
  final Color? bgColor;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final Widget img = Image.asset(
      imagePath,
      width: isCircle ? 50.w : width,
      height: isCircle ? 50.w : height,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => Icon(
        Icons.payment,
        color: bgColor != null && bgColor != Colors.transparent
            ? white
            : darkGreen,
        size: 32.r,
      ),
    );

    // if (isCircle) {
    //   return Container(
    //     width: 80,
    //     height: 80,
    //     decoration: BoxDecoration(
    //       color: bgColor ?? Colors.grey.shade200,
    //       shape: BoxShape.circle,
    //     ),
    //     child: Center(child: img),
    //   );
    // }

    return SizedBox(width: width, height: height, child: img);
  }
}
