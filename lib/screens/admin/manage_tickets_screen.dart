import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../widgets/admin_shared_widgets.dart';

class ManageTicketsScreen extends StatefulWidget {
  const ManageTicketsScreen({super.key});

  @override
  State<ManageTicketsScreen> createState() => _ManageTicketsScreenState();
}

class _ManageTicketsScreenState extends State<ManageTicketsScreen> {
  final _search = TextEditingController();

  final List<Map<String, dynamic>> tickets = [
    {'name': 'Hamza ail', 'team1': 'assets/teamfootball/Al_Ahly.png', 'team2': 'assets/teamfootball/Zamalek.png', 'comp': 'Nile 2026', 'date': '5 June 2026', 'time': '20:00', 'status': 'Valid'},
    {'name': 'Hamza ail', 'team1': 'assets/teamfootball/Zamalek.png', 'team2': 'assets/teamfootball/3.png', 'comp': 'Nile 2026', 'date': '18 MAY 2026', 'time': '19:00', 'status': 'Used'},
    {'name': 'Hamza ail', 'team1': 'assets/teamfootball/Al_Ahly.png', 'team2': 'assets/teamfootball/4.png', 'comp': 'Nile 2026', 'date': '14 May 2026', 'time': '22:00', 'status': 'Valid'},
    {'name': 'Hamza ail', 'team1': 'assets/teamfootball/5.png', 'team2': 'assets/teamfootball/6.png', 'comp': 'Nile 2026', 'date': '17 June 2026', 'time': '18:00', 'status': 'Valid'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: adminGreenAppBar('Manage Tickets', context),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 8.h),
            child: TextField(
              controller: _search,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search, color: darkGreen, size: 24.r),
                hintText: 'Search Tickets...',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 13.sp),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(color: darkGreen, width: 1.5.w)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.r),
                    borderSide: BorderSide(color: darkGreen, width: 2.w)),
                contentPadding: EdgeInsets.symmetric(vertical: 12.h),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: tickets.length,
              itemBuilder: (context, i) {
                final t = tickets[i];
                final bool isUsed = t['status'] == 'Used';
                return Container(
                  margin: EdgeInsets.only(bottom: 12.h),
                  padding: EdgeInsets.all(12.r),
                  decoration: BoxDecoration(
                    border: Border.all(color: darkGreen, width: 1.2.w),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Row(
                    children: [
                      Text(t['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13.sp)),
                      SizedBox(width: 8.w),
                      _teamImg(t['team1']),
                      SizedBox(width: 6.w),
                      Expanded(
                        child: Column(
                          children: [
                            Text(t['comp'],
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 11.sp)),
                            Text(t['date'],
                                style: TextStyle(
                                    color: darkGreen,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold)),
                            Text('KICK OFF',
                                style: TextStyle(
                                    fontSize: 11.sp, fontWeight: FontWeight.bold)),
                            Text(t['time'],
                                style: TextStyle(fontSize: 13.sp)),
                          ],
                        ),
                      ),
                      SizedBox(width: 6.w),
                      _teamImg(t['team2']),
                      SizedBox(width: 8.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: isUsed
                              ? Colors.grey.shade200
                              : const Color(0xFFD4EDDA),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                              color: isUsed ? Colors.grey : darkGreen,
                              width: 1.w),
                        ),
                        child: Text(t['status'],
                            style: TextStyle(
                                color: isUsed ? Colors.grey : darkGreen,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600)),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add, size: 20.r),
                label: Text('Generate Tickets',
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkGreen,
                  foregroundColor: white,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                  elevation: 0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _teamImg(String path) => Image.asset(path,
      width: 36.w,
      height: 36.w,
      errorBuilder: (_, __, ___) =>
          Icon(Icons.sports_soccer, size: 30.r, color: darkGreen));
}
