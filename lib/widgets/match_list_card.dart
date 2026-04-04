import 'package:flutter/material.dart';
import '../constants/colors.dart';

class MatchListCard extends StatelessWidget {
  final Map<String, dynamic> match;
  final String competitionLabel;
  final String detailRoute;

  const MatchListCard({
    super.key,
    required this.match,
    required this.competitionLabel,
    required this.detailRoute,
  });

  @override
  Widget build(BuildContext context) {
    final bool isWaiting = match['status'] == 'Wait for a Ticket';

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: const Color(0xA60C892D),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Column(
        children: [
          Text(
            competitionLabel,
            style: const TextStyle(
              color: gray,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            match['date'] as String,
            style: const TextStyle(
              color: darkGreen,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                match['team1'] as String,
                width: 64,
                height: 64,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.sports_soccer, color: white, size: 32),
                ),
              ),
              Column(
                children: [
                  const Text(
                    'KICK OFF',
                    style: TextStyle(
                      color: black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    match['time'] as String,
                    style: const TextStyle(
                      color: black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Image.asset(
                match['team2'] as String,
                width: 64,
                height: 64,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.sports_soccer, color: white, size: 32),
                ),
              ),
            ],
          ),
          const SizedBox(height: 2),
          SizedBox(
            width: 160,
            child: ElevatedButton(
              onPressed: isWaiting
                  ? null
                  : () => Navigator.pushNamed(
                        context,
                        detailRoute,
                        arguments: match,
                      ),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isWaiting ? Colors.grey.shade400 : darkGreen,
                foregroundColor: white,
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 0,
              ),
              child: Text(
                match['status'] as String,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
