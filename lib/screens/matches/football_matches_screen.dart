import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../core/data/match_data.dart';
import '../../core/router/app_router.dart';
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
            Align(
              alignment: Alignment.centerLeft,
              child: const CustomBackButton(),
            ),
            Expanded(
              child: ListView.builder(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
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
