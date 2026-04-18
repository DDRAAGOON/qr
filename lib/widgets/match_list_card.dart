import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/colors.dart';

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
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: const Color(0xA60C892D),
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          Text(
            competitionLabel,
            style: TextStyle(
              color: gray,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            match['date'] as String,
            style: TextStyle(
              color: darkGreen,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                match['team1'] as String,
                width: 64.w,
                height: 64.w,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Container(
                  width: 64.w,
                  height: 64.w,
                  decoration: BoxDecoration(
                    color: white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.sports_soccer, color: white, size: 32.r),
                ),
              ),
              Column(
                children: [
                  Text(
                    'KICK OFF',
                    style: TextStyle(
                      color: black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.w,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    match['time'] as String,
                    style: TextStyle(
                      color: black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Image.asset(
                match['team2'] as String,
                width: 64.w,
                height: 64.w,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Container(
                  width: 64.w,
                  height: 64.w,
                  decoration: BoxDecoration(
                    color: white.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.sports_soccer, color: white, size: 32.r),
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          SizedBox(
            width: 160.w,
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
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                elevation: 0,
              ),
              child: Text(
                match['status'] as String,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5.w,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
