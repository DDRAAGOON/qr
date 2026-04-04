import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import '../router/app_router.dart';
import '../widgets/bottom_nav.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 12),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left, color: darkGreen, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Expanded(
                    child: Text(
                      'Payment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: darkGreen,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: black, width: 1.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total Amount',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: black,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: black, width: 1.5),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '${_amountValue.toStringAsFixed(0)} EGP',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              const Text(
                'You can transfer using any of\nfollowing methods',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: black,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: _PaymentLogo(
                      imagePath: 'assets/payment/foda.png',
                      isCircle: true,
                      bgColor: const Color(0xFFEEEEEE),
                    ),
                  ),
                  Expanded(
                    child: _PaymentLogo(
                      imagePath: 'assets/payment/instapay.png',
                      isCircle: true,
                      bgColor: const Color(0xFF6B2D8B),
                    ),
                  ),
                  Expanded(
                    child: _PaymentLogo(
                      imagePath: 'assets/payment/orange.png',
                      isCircle: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _PaymentLogo(
                    imagePath: 'assets/payment/fawry.png',
                    isCircle: false,
                    width: 130,
                    height: 52,
                  ),
                  _PaymentLogo(
                    imagePath: 'assets/payment/ea.png',
                    isCircle: false,
                    width: 130,
                    height: 52,
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const Text(
                transferPhoneNumber,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: black,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: 160,
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
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Copy',
                    style: TextStyle(
                      fontSize: 15,
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Upload screenshot — connect your picker here'),
                        backgroundColor: darkGreen,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkGreen,
                    foregroundColor: white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Upload Screenshot',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () =>
                    Navigator.pushNamed(context, AppRoutes.qrTicket),
                child: const Text(
                  'I completed payment — show ticket',
                  style: TextStyle(
                    color: darkGreen,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(height: 12),
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
      width: isCircle ? 50 : width,
      height: isCircle ? 50 : height,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) => Icon(
        Icons.payment,
        color: bgColor != null && bgColor != Colors.transparent
            ? white
            : darkGreen,
        size: 32,
      ),
    );

    if (isCircle) {
      return Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.grey.shade200,
          shape: BoxShape.circle,
        ),
        child: Center(child: img),
      );
    }

    return SizedBox(width: width, height: height, child: img);
  }
}
