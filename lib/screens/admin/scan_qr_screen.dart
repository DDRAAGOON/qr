import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';

class ScanQRScreen extends StatelessWidget {
  const ScanQRScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            // Back
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: Icon(Icons.chevron_left, color: white, size: 30.r),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SizedBox(height: 8.h),
            Text('scan qr code/barcode',
                style: TextStyle(color: white, fontSize: 18.sp, fontWeight: FontWeight.w600)),
            SizedBox(height: 6.h),
            Text('Align the QR code/barcode below',
                style: TextStyle(color: Colors.grey, fontSize: 13.sp)),

            const Spacer(),

            // Scanner frame
            SizedBox(
              width: 260.w,
              height: 260.w,
              child: CustomPaint(painter: _ScannerFramePainter()),
            ),

            const Spacer(),

            // Torch button
            Column(
              children: [
                Container(
                  width: 52.w,
                  height: 52.w,
                  decoration: const BoxDecoration(
                      color: Color(0xFF333333), shape: BoxShape.circle),
                  child: Icon(Icons.lightbulb, color: white, size: 26.r),
                ),
                SizedBox(height: 8.h),
                Text('Touch for more light',
                    style: TextStyle(color: white, fontSize: 13.sp)),
              ],
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}

class _ScannerFramePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = darkGreen
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.square;

    final double len = 40.w;
    final w = size.width;
    final h = size.height;

    // Top-left
    canvas.drawLine(Offset(0, len), Offset(0, 0), paint);
    canvas.drawLine(Offset(0, 0), Offset(len, 0), paint);
    // Top-right
    canvas.drawLine(Offset(w - len, 0), Offset(w, 0), paint);
    canvas.drawLine(Offset(w, 0), Offset(w, len), paint);
    // Bottom-left
    canvas.drawLine(Offset(0, h - len), Offset(0, h), paint);
    canvas.drawLine(Offset(0, h), Offset(len, h), paint);
    // Bottom-right
    canvas.drawLine(Offset(w - len, h), Offset(w, h), paint);
    canvas.drawLine(Offset(w, h - len), Offset(w, h), paint);

    // Scan line
    final linePaint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..strokeWidth = 1;
    canvas.drawLine(Offset(0, h / 2), Offset(w, h / 2), linePaint);
  }

  @override
  bool shouldRepaint(_) => false;
}
