import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../core/constants/colors.dart';
import '../../widgets/bottom_nav.dart';

class QRTicketScreen extends StatelessWidget {
  const QRTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 57.h),
            Text(
              'Payment Approved ✓',
              style: TextStyle(
                  fontSize: 24.sp, fontWeight: FontWeight.bold, color: black),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: 'https://example.com/ticket/12345',
                      version: QrVersions.auto,
                      size: 300.w,
                      backgroundColor: Colors.white,
                    ),
                    SizedBox(height: 18.h),
                    Text('Show this QR code at the gate',
                        style: TextStyle(color: black, fontSize: 16.sp)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}
