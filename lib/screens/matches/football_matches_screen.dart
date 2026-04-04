import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../data/match_data.dart';
import '../../router/app_router.dart';
import '../../widgets/back_button.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/match_list_card.dart';

class FootballMatchesScreen extends StatelessWidget {
  const FootballMatchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomBackButton(),
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                itemCount: footballMatches.length,
                itemBuilder: (context, index) {
                  return MatchListCard(
                    match: footballMatches[index],
                    competitionLabel: 'Nile 2026',
                    detailRoute: AppRoutes.footballMatchDetail,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}
