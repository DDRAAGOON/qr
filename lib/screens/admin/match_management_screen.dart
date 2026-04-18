import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../widgets/admin_shared_widgets.dart';

class MatchManagementScreen extends StatefulWidget {
  const MatchManagementScreen({super.key});

  @override
  State<MatchManagementScreen> createState() => _MatchManagementScreenState();
}

class _MatchManagementScreenState extends State<MatchManagementScreen> {
  final List<Map<String, dynamic>> matches = [
    {'comp': 'EPL', 'time': '22:00', 'date': '14 May 2026', 'team1': 'Al Ahly', 'team2': 'Smouha', 'logo1': 'assets/teamfootball/Al_Ahly.png', 'logo2': 'assets/teamfootball/4.png'},
    {'comp': 'EPL', 'time': '19:00', 'date': '18 May 2026', 'team1': 'Zamalek', 'team2': 'National Bank', 'logo1': 'assets/teamfootball/Zamalek.png', 'logo2': 'assets/teamfootball/5.png'},
    {'comp': 'EPL', 'time': '18:00', 'date': '17 June 2026', 'team1': 'Al Ittihad', 'team2': 'Al Masry', 'logo1': 'assets/teamfootball/6.png', 'logo2': 'assets/teamfootball/image 2.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: adminGreenAppBar('Match Management', context),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: darkGreen,
                    foregroundColor: white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Add Match', style: TextStyle(fontSize: 14.sp)),
                      SizedBox(width: 8.w),
                      Icon(Icons.add, size: 18.r),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: _StatCard(
                    label: "Today's Matches",
                    labelColor: const Color(0xFF5C5C5C),
                    value: '4',
                    valueColor: Colors.black,
                    bgColor: const Color(0xFF9B9B9B),
                  ),
                ),
                SizedBox(width: 29.w),
                Expanded(
                  child: _StatCard(
                    label: 'Total Matches',
                    labelColor: const Color(0xFF5C5C5C),
                    value: '17',
                    valueColor: Colors.black,
                    bgColor: const Color(0xFF9B9B9B),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: matches.length,
              itemBuilder: (_, i) {
                final m = matches[i];
                return Container(
                  margin: EdgeInsets.only(bottom: 14.h),
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffC4C4C4)),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [
                      const SizedBox(width: double.infinity),
                      // Left: Delete icon
                      Positioned(
                        left: -15.w, top: -15.h,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: Icon(Icons.delete_outline, color: Colors.red, size: 22.r),
                          onPressed: () => setState(() => matches.removeAt(i)),
                        ),
                      ),
                      // Right: Date
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                              color: darkGreen,
                              borderRadius: BorderRadius.circular(6.r)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(m['date'],
                                  style: TextStyle(color: white, fontSize: 11.sp)),
                              SizedBox(width: 4.w),
                              Icon(Icons.calendar_today_outlined,
                                  size: 11.r, color: white),
                            ],
                          ),
                        ),
                      ),
                      // Centered content
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _greenTag(m['comp']),
                            SizedBox(height: 8.h),
                            Text(m['time'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15.sp)),
                            SizedBox(height: 8.h),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Column(children: [
                                  _logoImg(m['logo1']),
                                  SizedBox(height: 4.h),
                                  Text(m['team1'],
                                      style: TextStyle(fontSize: 12.sp)),
                                ]),
                                SizedBox(width: 16.w),
                                Text('— vs —',
                                    style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                                SizedBox(width: 16.w),
                                Column(children: [
                                  _logoImg(m['logo2']),
                                  SizedBox(height: 4.h),
                                  Text(m['team2'],
                                      style: TextStyle(fontSize: 12.sp)),
                                ]),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoImg(String p) => Image.asset(p,
      width: 44.w,
      height: 44.w,
      errorBuilder: (_, __, ___) =>
          Icon(Icons.sports_soccer, size: 36.r, color: darkGreen));

  Widget _greenTag(String t) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 3.h),
        decoration: BoxDecoration(
            color: darkGreen,
            borderRadius: BorderRadius.circular(6.r)),
        child: Text(t,
            style: TextStyle(color: white, fontSize: 12.sp)));
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color? bgColor;
  final Color? labelColor;
  final Color? valueColor;

  const _StatCard({
    required this.label,
    required this.value,
    this.bgColor,
    this.labelColor,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
      decoration: BoxDecoration(
          color: bgColor ?? Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12.r)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(label,
            style: TextStyle(color: labelColor ?? Colors.grey, fontSize: 12.sp)),
        SizedBox(height: 6.h),
        Text(value,
            style: TextStyle(
                color: valueColor ?? Colors.black,
                fontSize: 22.sp,
                fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
