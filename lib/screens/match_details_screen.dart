import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/back_button.dart';
import '../widgets/bottom_nav.dart';

class MatchDetailsScreen extends StatelessWidget {
  final String gameType;
  const MatchDetailsScreen({super.key, required this.gameType});

  @override
  Widget build(BuildContext context) {
    final String mapImage = gameType == 'Football'
        ? 'assets/images/football_stadium_map.png'
        : 'assets/images/handball_court_map.png';
    final String price = gameType == 'Football' ? '160' : '120';

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Column(
          children: [
            const CustomBackButton(),
            Container(
              color: darkGreen,
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(gameType == 'Football'
                      ? 'assets/teamfootball/Al_Ahly.png'
                      : 'assets/teamhandball/Al_Ahly.png', width: 50),
                  Column(
                    children: [
                      const Text('CAN 2026', style: TextStyle(color: white, fontSize: 16)),
                      const Text('5 June 2026', style: TextStyle(color: white)),
                      const Text('KICK OFF', style: TextStyle(color: white)),
                      const Text('20:00', style: TextStyle(color: white)),
                    ],
                  ),
                  Image.asset(gameType == 'Football'
                      ? 'assets/teamfootball/Zamalek.png'
                      : 'assets/teamhandball/Zamalek.png', width: 50),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.event_seat),
              label: const Text('Cat3 - Left'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 50),
                backgroundColor: darkGreen,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              icon: const Icon(Icons.event_seat),
              label: const Text('Cat3 - Right'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 50),
                backgroundColor: darkGreen,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.attach_money),
              label: Text('Buy a ticket > $price'),
              onPressed: () => Navigator.pushNamed(context, '/qr_ticket'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(250, 50),
                backgroundColor: darkGreen,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset(mapImage, width: 300),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}
