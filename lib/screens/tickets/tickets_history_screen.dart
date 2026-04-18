import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/colors.dart';
import '../../core/data/tickets_history_data.dart';
import '../../widgets/bottom_nav.dart';
import '../../widgets/ticket_history_item.dart';

/// سجل التذاكر المشتراة.
class TicketsHistoryScreen extends StatelessWidget {
  const TicketsHistoryScreen({super.key});

  static const Color _dividerColor = Color(0xFFD0CBC4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: darkGreen,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: white, size: 28.r),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Tickets History',
          style: TextStyle(
            color: white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        itemCount: kTicketsHistoryData.length,
        separatorBuilder: (_, __) => Divider(
          height: 32.h,
          thickness: 1.h,
          color: _dividerColor,
        ),
        itemBuilder: (context, i) {
          return TicketHistoryItem(ticket: kTicketsHistoryData[i]);
        },
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}
