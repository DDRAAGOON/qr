import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../router/app_router.dart';
import '../../widgets/bottom_nav.dart';

class HandballDetailScreen extends StatelessWidget {
  final Map<String, dynamic>? match;

  const HandballDetailScreen({super.key, this.match});

  static const double categoryLabelShiftRight = 35;

  static const Color matchTimeColor = black;

  @override
  Widget build(BuildContext context) {
    final String team1 = match?['team1'] as String? ??
        'assets/teamhandball/Al_Ahly.png';
    final String team2 = match?['team2'] as String? ??
        'assets/teamhandball/Zamalek.png';
    final String date = match?['date'] as String? ?? '8 June 2026';
    final String time = match?['time'] as String? ?? '19:00';
    const String price = '120.00 EGP';

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 12, 16, 40),
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 42,
                  height: 42,
                  decoration: const BoxDecoration(
                    color: darkGreen,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.chevron_left, color: white, size: 26),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: BoxDecoration(
                color: lightGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    team1,
                    width: 64,
                    height: 64,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.sports_handball,
                      color: white,
                      size: 48,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Nile 2026',
                        style: TextStyle(
                          color: gray,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        date,
                        style: const TextStyle(
                          color: darkGreen,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'THROW OFF',
                        style: TextStyle(
                          color: black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        time,
                        style: const TextStyle(
                          color: matchTimeColor,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    team2,
                    width: 64,
                    height: 64,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.sports_handball,
                      color: white,
                      size: 48,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 44),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 75),
              child: Column(
                children: [
                  _CategoryButton(
                    label: 'Cat3 - Left',
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.payment,
                      arguments: {
                        'seat': 'Cat3 - Left',
                        'amount': price,
                      },
                    ),
                    textShiftRight: categoryLabelShiftRight,
                  ),
                  const SizedBox(height: 24),
                  _CategoryButton(
                    label: 'Cat3 - Right',
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.payment,
                      arguments: {
                        'seat': 'Cat3 - Right',
                        'amount': price,
                      },
                    ),
                    textShiftRight: categoryLabelShiftRight,
                  ),
                  const SizedBox(height: 24),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      AppRoutes.payment,
                      arguments: {
                        'seat': 'Selected ticket',
                        'amount': price,
                      },
                    ),
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: darkGreen,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/icons/money.png',
                            width: 32,
                            height: 22,
                            color: white,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Price',
                            style: TextStyle(
                              color: white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            price,
                            style: const TextStyle(
                              color: white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 77),
            Center(
              child: Image.asset(
                'assets/studio/handball.png',
                width: 294,
                height: 171,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double textShiftRight;

  const _CategoryButton({
    required this.label,
    required this.onTap,
    this.textShiftRight = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13),
        decoration: BoxDecoration(
          color: darkGreen,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.event_seat_outlined,
              size: 41,
              color: white,
            ),
            const SizedBox(width: 14),
            Padding(
              padding: EdgeInsets.only(left: textShiftRight),
              child: Text(
                label,
                style: const TextStyle(
                  color: white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
