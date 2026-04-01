import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/back_button.dart';
import '../widgets/bottom_nav.dart';

class MatchesScreen extends StatelessWidget {
  final String gameType;
  const MatchesScreen({super.key, required this.gameType});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> footballMatches = [
      {
        'team1': 'assets/teamfootball/Al_Ahly.png',
        'team2': 'assets/teamfootball/Zamalek.png',
        'date': '5 June 2026',
        'time': '20:00',
        'status': 'Buy Ticket',
        'soldOut': false,
      },
      {
        'team1': 'assets/teamfootball/image 2.png',
        'team2': 'assets/teamfootball/3.png',
        'date': '17 June 2026',
        'time': '18:00',
        'status': 'Buy Ticket',
        'soldOut': false,
      },
      {
        'team1': 'assets/teamfootball/4.png',
        'team2': 'assets/teamfootball/5.png',
        'date': '21 June 2026',
        'time': '21:00',
        'status': 'Wait for a Ticket',
        'soldOut': false,
      },
      {
        'team1': 'assets/teamfootball/6.png',
        'team2': 'assets/teamfootball/Al_Ahly.png',
        'date': '2 July 2026',
        'time': '17:00',
        'status': 'Buy Ticket',
        'soldOut': false,
      },
      {
        'team1': 'assets/teamfootball/Zamalek.png',
        'team2': 'assets/teamfootball/image 2.png',
        'date': '19 July 2026',
        'time': '16:00',
        'status': 'Buy Ticket',
        'soldOut': false,
      },
    ];

    final List<Map<String, dynamic>> handballMatches = [
      {
        'team1': 'assets/teamhandball/Al_Ahly.png',
        'team2': 'assets/teamhandball/Zamalek.png',
        'date': '8 June 2026',
        'time': '19:00',
        'status': 'Buy Ticket',
        'soldOut': false,
      },
      {
        'team1': 'assets/teamhandball/2.png',
        'team2': 'assets/teamhandball/3.png',
        'date': '15 June 2026',
        'time': '17:00',
        'status': 'Buy Ticket',
        'soldOut': false,
      },
      {
        'team1': 'assets/teamhandball/Al_Ahly.png',
        'team2': 'assets/teamhandball/3.png',
        'date': '25 June 2026',
        'time': '20:00',
        'status': 'Wait for a Ticket',
        'soldOut': false,
      },
      {
        'team1': 'assets/teamhandball/Zamalek.png',
        'team2': 'assets/teamhandball/2.png',
        'date': '5 July 2026',
        'time': '18:00',
        'status': 'Buy Ticket',
        'soldOut': false,
      },
    ];

    final matches = gameType == 'Football' ? footballMatches : handballMatches;

    return Scaffold(
      backgroundColor: veryLightGray,
      body: SafeArea(
        child: Column(
          children: [
            const CustomBackButton(),
            Expanded(
              child: ListView.builder(
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  final match = matches[index];
                  return Card(
                    color: mediumGreen,
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(match['team1'], width: 50, height: 50),
                          Column(
                            children: [
                              const Text('CAN 2026', style: TextStyle(color: white, fontSize: 16)),
                              Text(match['date'], style: const TextStyle(color: white)),
                              const Text('KICK OFF', style: TextStyle(color: white)),
                              Text(match['time'], style: const TextStyle(color: white)),
                            ],
                          ),
                          Image.asset(match['team2'], width: 50, height: 50),
                        ],
                      ),
                    ),
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
