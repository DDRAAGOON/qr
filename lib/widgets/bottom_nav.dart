import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../router/app_router.dart';

/// Single bottom bar used across main app screens (home, match lists, details, QR).
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
          _NavIcon(
            icon: Icons.home_outlined,
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home,
              (route) => false,
            ),
          ),
          _NavIcon(
            icon: Icons.history,
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.ticketsHistory,
            ),
          ),
          _NavIcon(
            icon: Icons.person_outline,
            onTap: () => Navigator.pushNamed(
              context,
              AppRoutes.editProfile,
            ),
          ),
          _NavIcon(
            icon: Icons.exit_to_app,
            onTap: () => Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.login,
              (route) => false,
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
