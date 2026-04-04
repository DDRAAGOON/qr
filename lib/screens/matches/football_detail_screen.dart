import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../widgets/bottom_nav.dart';

class FootballDetailScreen extends StatelessWidget {
  final Map<String, dynamic>? match;

  const FootballDetailScreen({super.key, this.match});

  static const double categoryLabelShiftRight = 35;

  /// حجم زر Cat3 (قلّل الأرقام عشان الزر يصغر — الشكل نفسه).
  static const double categoryButtonHorizontalPadding = 40;  // ✅ زودتها عشان التناسق
  static const double categoryButtonVerticalPadding = 8;    // ✅ زودتها عشان التناسق
  static const double categoryButtonIconSize = 41;           // ✅ قللتها شوية
  static const double categoryButtonIconTextGap = 20;        // ✅ قللتها عشان المسافة
  static const double categoryButtonFontSize = 16;           // ✅ زودتها شوية
  static const double categoryButtonBorderRadius = 8;       // ✅ زودتها
  static const double categoryButtonsVerticalGap = 14;       // ✅ زودت المسافة بين الزرارين

  /// مسافات كتلة Cat3 + السعر من حواف الشاشة.
  static const double categorySectionPaddingLeft = 80;
  static const double categorySectionPaddingTop = 44;
  static const double categorySectionPaddingRight = 30;
  static const double categorySectionPaddingBottom = 50;

  static const Color matchTimeColor = black;

  @override
  Widget build(BuildContext context) {
    final String team1 =
        match?['team1'] as String? ?? 'assets/teamfootball/Al_Ahly.png';
    final String team2 =
        match?['team2'] as String? ?? 'assets/teamfootball/Zamalek.png';
    final String date = match?['date'] as String? ?? '21 June 2026';
    final String time = match?['time'] as String? ?? '21:00';
    const String price = '75.00 EGP';

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
                      Icons.sports_soccer,
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
                        'KICK OFF',
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
                      Icons.sports_soccer,
                      color: white,
                      size: 48,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                categorySectionPaddingLeft,
                categorySectionPaddingTop,
                categorySectionPaddingRight,
                categorySectionPaddingBottom,
              ),
              child: Column(
                children: [
                  _CategoryButton(
                    label: 'Cat3 - Left',
                    onTap: () {
                      Navigator.pushNamed(context, '/payment');
                    },
                    textShiftRight: categoryLabelShiftRight,
                  ),
                  SizedBox(height: categoryButtonsVerticalGap),
                  _CategoryButton(
                    label: 'Cat3 - Right',
                    onTap: () {
                      Navigator.pushNamed(context, '/payment');
                    },
                    textShiftRight: categoryLabelShiftRight,
                  ),
                  const SizedBox(height: 13),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/payment');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: darkGreen,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/icons/money.png',
                            width: 28,
                            height: 20,
                            color: white,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Price',
                            style: TextStyle(
                              color: white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            price,
                            style: const TextStyle(
                              color: white,
                              fontSize: 16,
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
            Center(
              child: Image.asset(
                'assets/studio/football.png',
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
        padding: EdgeInsets.symmetric(
          horizontal: FootballDetailScreen.categoryButtonHorizontalPadding,
          vertical: FootballDetailScreen.categoryButtonVerticalPadding,
        ),
        decoration: BoxDecoration(
          color: darkGreen,
          borderRadius: BorderRadius.circular(
            FootballDetailScreen.categoryButtonBorderRadius,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/seat.png',
              width: FootballDetailScreen.categoryButtonIconSize,
              height: FootballDetailScreen.categoryButtonIconSize,
              color: white,
            ),
            SizedBox(width: FootballDetailScreen.categoryButtonIconTextGap),
            Padding(
              padding: EdgeInsets.only(left: textShiftRight),
              child: Text(
                label,
                style: TextStyle(
                  color: white,
                  fontSize: FootballDetailScreen.categoryButtonFontSize,
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