import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../constants/colors.dart';
import '../widgets/bottom_nav.dart';

class QRTicketScreen extends StatelessWidget {
  const QRTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 57),
            const Text(
              'Payment Approved ✓',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: black),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: 'https://example.com/ticket/12345',
                      version: QrVersions.auto,
                      size: 300.0,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(height: 18),
                    const Text('Show this QR code at the gate',
                        style: TextStyle(color: black, fontSize: 16)),
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
