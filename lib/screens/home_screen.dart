import 'package:flutter/material.dart';
import '../constants/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          // ── Hero Image Section ──────────────────────────────────
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
            child: SizedBox(
              height: 300,
              width: double.infinity,
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
                  )

                  // Football ball — bottom left
                ],
              ),
            ),
          ),

          const SizedBox(height: 36),

          // ── Sport Buttons ───────────────────────────────────────
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                children: [
                  _SportButton(
                    label: 'FOOTBALL',
                    onTap: () => Navigator.pushNamed(context, '/matches/football'),
                  ),
                  const SizedBox(height: 16),
                  _SportButton(
                    label: 'HANDBALL',
                    onTap: () => Navigator.pushNamed(context, '/matches/handball'),
                  ),
                  const SizedBox(height: 16),
                  _SportButton(
                    label: 'OTHER GAMES',
                    onTap: () {},
                  ),
                  const SizedBox(height: 28),

                  // Subtitle
                  const Text(
                    '- ENJOY EVERY MOMENT -',
                    style: TextStyle(
                      color: darkGreen,
                      fontSize: 12,
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

// ── Bottom Navigation Bar ─────────────────────────────────────────
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: darkGreen,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _NavIcon(icon: Icons.home_outlined, onTap: () {}),
          _NavIcon(icon: Icons.history, onTap: () {}),
          _NavIcon(icon: Icons.person_outline, onTap: () {}),
          _NavIcon(
            icon: Icons.exit_to_app,
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context, '/login', (route) => false,
            ),
          ),
        ],
      ),
    );
  }
}

class _NavIcon extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _NavIcon({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(icon, color: white, size: 28),
    );
  }
}