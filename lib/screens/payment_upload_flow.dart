import 'dart:math' as math;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/colors.dart';
import '../router/app_router.dart';
import '../widgets/bottom_nav.dart';

class UploadPaymentScreenshotScreen extends StatefulWidget {
  const UploadPaymentScreenshotScreen({super.key});

  @override
  State<UploadPaymentScreenshotScreen> createState() =>
      _UploadPaymentScreenshotScreenState();
}

class _UploadPaymentScreenshotScreenState
    extends State<UploadPaymentScreenshotScreen> {
  static const int _maxBytes = 5 * 1024 * 1024;

  final ImagePicker _picker = ImagePicker();
  String? _fileName;
  Uint8List? _imageBytes;

  Future<void> _pickImage() async {
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      showDragHandle: true,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.photo_library_outlined),
              title: const Text('المعرض'),
              onTap: () => Navigator.pop(ctx, ImageSource.gallery),
            ),
            ListTile(
              leading: const Icon(Icons.photo_camera_outlined),
              title: const Text('الكاميرا'),
              onTap: () => Navigator.pop(ctx, ImageSource.camera),
            ),
          ],
        ),
      ),
    );
    if (source == null || !mounted) return;

    try {
      final x = await _picker.pickImage(
        source: source,
        maxWidth: 1920,
        imageQuality: 88,
      );
      if (x == null || !mounted) return;

      final bytes = await x.readAsBytes();
      if (bytes.length > _maxBytes) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('الصورة أكبر من 5 ميجابايت'),
            backgroundColor: darkGreen,
          ),
        );
        return;
      }

      setState(() {
        _imageBytes = bytes;
        _fileName = x.name;
      });
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تعذر اختيار الصورة: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 43,
                  height: 43,
                  decoration: const BoxDecoration(
                    color: darkGreen,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.chevron_left, color: white, size: 26),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Upload Payment Screenshot',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
              ),
              const Spacer(),
              Center(
                child: GestureDetector(
                  onTap: _pickImage,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      width: 300,
                      height: 200,
                      color: Colors.grey.shade300,
                      child: _imageBytes == null
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_outlined,
                                  size: 52,
                                  color: Colors.grey.shade700,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Tap to upload screenshot',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.grey.shade800,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  'PNG, JPEG, up to 5MB',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            )
                          : Stack(
                              fit: StackFit.expand,
                              children: [
                                Image.memory(
                                  _imageBytes!,
                                  fit: BoxFit.cover,
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  child: Container(
                                    color: Colors.black54,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 8,
                                    ),
                                    child: Text(
                                      _fileName ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        color: white,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                   width: 125,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.paymentUnderReview,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkGreen,
                      foregroundColor: white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}

/// انتظار موافقة الأدمن.
class PaymentUnderReviewScreen extends StatefulWidget {
  const PaymentUnderReviewScreen({super.key});

  @override
  State<PaymentUnderReviewScreen> createState() =>
      _PaymentUnderReviewScreenState();
}

class _PaymentUnderReviewScreenState extends State<PaymentUnderReviewScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 57,),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 1),
                child: Text(
                  'Payment Under Review',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
              ),
              const SizedBox(height: 300),
              const Text(
                'Waiting for admin approval',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              AnimatedBuilder(
                animation: _controller,
                builder: (_, __) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * math.pi,
                    child: CustomPaint(
                      size: const Size(112, 112),
                      painter: _DashedCirclePainter(color: darkGreen),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashedCirclePainter extends CustomPainter {
  const _DashedCirclePainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    const int dashCount = 10;
    const double gapFraction = 0.4;
    final double cx = size.width / 2;
    final double cy = size.height / 2;
    final double radius = size.width / 2 - 4;
    const double fullAngle = 2 * math.pi;
    final double dashAngle = fullAngle / dashCount * (1 - gapFraction);
    final double gapAngle = fullAngle / dashCount * gapFraction;

    double startAngle = 0;
    for (int i = 0; i < dashCount; i++) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(cx, cy), radius: radius),
        startAngle,
        dashAngle,
        false,
        paint,
      );
      startAngle += dashAngle + gapAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
