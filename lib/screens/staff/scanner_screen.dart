import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({super.key});

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final MobileScannerController _scannerController = MobileScannerController();
  bool _isScanning = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scannerController.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (!mounted || !_isScanning) return;
    
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty) {
      setState(() => _isScanning = false);
      
      final String code = barcodes.first.rawValue ?? "";
      debugPrint('Barcode found! $code');

      // Stop the scanner before navigating to avoid resource conflicts / red screen
      _scannerController.stop();

      // Logic to determine success/failure (Mock logic)
      Future.delayed(const Duration(milliseconds: 500), () {
        if (!mounted) return;
        if (code.toLowerCase().contains('fail')) {
          Navigator.pushReplacementNamed(context, AppRoutes.staffFailure);
        } else {
          Navigator.pushReplacementNamed(context, AppRoutes.staffSuccess);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: white, size: 22.r),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background Camera View
          MobileScanner(
            controller: _scannerController,
            onDetect: _onDetect,
          ),

          // Dark Overlay with Cutout
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              black.withValues(alpha: 0.7),
              BlendMode.srcOut,
            ),
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    backgroundBlendMode: BlendMode.dstOut,
                  ),
                ),
                Center(
                  child: Container(
                    width: 260.w,
                    height: 260.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Texts
          Positioned(
            top: 120.h,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Text(
                  'Scan QR Code / Barcode',
                  style: TextStyle(
                    color: white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 12.h),
                // Text(
                //   'Align the code within the frame below',
                //   style: TextStyle(
                //     color: white.withValues(alpha: 0.7),
                //     fontSize: 14.sp,
                //   ),
                // ),
              ],
            ),
          ),

          // Scanner Frame and Animated Line
          Center(
            child: SizedBox(
              width: 260.w,
              height: 260.w,
              child: Stack(
                children: [
                  const ScannerCorners(),
                  // Scanning Line Animation
                  AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Positioned(
                        top: _animationController.value * 260.w,
                        left: 10.w,
                        right: 10.w,
                        child: Container(
                          height: 2.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.greenAccent.withValues(alpha: 0.8),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                            color: Colors.greenAccent,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Flash Button
          Positioned(
            bottom: 80.h,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () => _scannerController.toggleTorch(),
                child: Container(
                  width: 64.w,
                  height: 64.w,
                  decoration: BoxDecoration(
                    color: white.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.flashlight_on, color: white, size: 28.r),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScannerCorners extends StatelessWidget {
  const ScannerCorners({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _ScannerCornersPainter(),
      child: Container(),
    );
  }
}

class _ScannerCornersPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.greenAccent
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const double cornerSize = 30;

    // Top Left
    canvas.drawPath(
      Path()
        ..moveTo(0, cornerSize)
        ..lineTo(0, 0)
        ..lineTo(cornerSize, 0),
      paint,
    );

    // Top Right
    canvas.drawPath(
      Path()
        ..moveTo(size.width - cornerSize, 0)
        ..lineTo(size.width, 0)
        ..lineTo(size.width, cornerSize),
      paint,
    );

    // Bottom Left
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height - cornerSize)
        ..lineTo(0, size.height)
        ..lineTo(cornerSize, size.height),
      paint,
    );

    // Bottom Right
    canvas.drawPath(
      Path()
        ..moveTo(size.width - cornerSize, size.height)
        ..lineTo(size.width, size.height)
        ..lineTo(size.width, size.height - cornerSize),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
