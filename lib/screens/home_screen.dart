import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../router/app_router.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
        children: [
          // ── Hero Image Section ──────────────────────────────────
          ClipRRect(
            child: SizedBox(
              height: 383,
              width: 432,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Stadium background
                  Image.asset(
                    'assets/image/stadium.png',
                    fit: BoxFit.cover,
                  ),

                  // QR TICKET text — top left
                  const Positioned(
                    top: 60,
                    left: 28,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),

                  // Football player — right side
                  Positioned(
                    child: Image.asset(
                      'assets/image/football.png',
                      fit: BoxFit.none,  // تحافظ على الحجم الأصلي للصورة
                    ),
                  ),

                  // Football ball — bottom left
                ],
              ),
            ),
          ),

          const SizedBox(height: 50),

          // ── Sport Buttons ───────────────────────────────────────
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  _SportButton(
                    label: 'FOOTBALL',
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.footballMatches,
                    ),
                  ),

                  const SizedBox(height: 55),

                  // Subtitle
                  const Text(
                    '- ENJOY EVERY MOMENT -',
                    style: TextStyle(
                      color: darkGreen,
                      fontSize: 15,
                      letterSpacing: 2.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
      // ── Bottom Nav ──────────────────────────────────────────────
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}

// ── Reusable Sport Button ─────────────────────────────────────────
class _SportButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _SportButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: darkGreen,
          foregroundColor: white,
          padding: const EdgeInsets.symmetric(vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}