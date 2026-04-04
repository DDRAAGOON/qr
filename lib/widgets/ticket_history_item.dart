import 'package:flutter/material.dart';

import '../constants/colors.dart';

class TicketHistoryItem extends StatelessWidget {
  const TicketHistoryItem({super.key, required this.ticket});

  final Map<String, dynamic> ticket;

  @override
  Widget build(BuildContext context) {
    final String status = ticket['status'] as String? ?? '';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                ticket['title'] as String? ?? '',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  _logoImg(ticket['logo1'] as String? ?? ''),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      '— vs —',
                      style: TextStyle(color: black, fontSize: 13),
                    ),
                  ),
                  _logoImg(ticket['logo2'] as String? ?? ''),
                ],
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    ticket['date'] as String? ?? '',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                  ),
                  const Text(
                    '  -  ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    ticket['time'] as String? ?? '',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Price: ${ticket['price']}',
                style: const TextStyle(
                  fontSize: 14,
                  color: black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: _statusBackground(status),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  color: white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(1),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/seat.png',
                    width: 17,
                    height: 17,
                    color: Colors.grey.shade700,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    ticket['category'] as String? ?? '',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Color _statusBackground(String status) {
    switch (status) {
      case 'Completed':
        return darkGreen;
      case 'Pending':
        return Colors.orange.shade700;
      default:
        return gray1;
    }
  }

  Widget _logoImg(String path) {
    return Image.asset(
      path,
      width: 44,
      height: 44,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) =>
          const Icon(Icons.sports_soccer, size: 36, color: darkGreen),
    );
  }
}
