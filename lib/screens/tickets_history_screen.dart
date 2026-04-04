import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../data/tickets_history_data.dart';
import '../widgets/bottom_nav.dart';
import '../widgets/ticket_history_item.dart';

/// سجل التذاكر المشتراة.
class TicketsHistoryScreen extends StatelessWidget {
  const TicketsHistoryScreen({super.key});

  static const Color _dividerColor = Color(0xFFD0CBC4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: darkGreen,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Tickets History',
          style: TextStyle(
            color: white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        itemCount: kTicketsHistoryData.length,
        separatorBuilder: (_, __) => const Divider(
          height: 32,
          thickness: 1,
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
