import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../constants/colors.dart';
import '../widgets/back_button.dart';
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
            const CustomBackButton(),
            const SizedBox(height: 20),
            const Text(
              'Payment Approved ✓',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: darkGreen),
            ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: 'https://example.com/ticket/12345',
                      version: QrVersions.auto,
                      size: 200.0,
                      backgroundColor: Colors.white,
                    ),
                    const SizedBox(height: 20),
                    const Text('Show this QR code at the gate', style: TextStyle(color: black)),
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
