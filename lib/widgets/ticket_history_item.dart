import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/colors.dart';

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
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  _logoImg(ticket['logo1'] as String? ?? ''),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.w),
                    child: Text(
                      '— vs —',
                      style: TextStyle(color: black, fontSize: 13.sp),
                    ),
                  ),
                  _logoImg(ticket['logo2'] as String? ?? ''),
                ],
              ),
              SizedBox(height: 3.h),
              Row(
                children: [
                  Text(
                    ticket['date'] as String? ?? '',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: black,
                    ),
                  ),
                  Text(
                    '  -  ',
                    style: TextStyle(color: Colors.grey, fontSize: 14.sp),
                  ),
                  Text(
                    ticket['time'] as String? ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                'Price: ${ticket['price']}',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: black,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: status == 'Completed'
                  ? () => Navigator.pushNamed(context, '/qr_ticket')
                  : null,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: _statusBackground(status),
                  borderRadius: BorderRadius.circular(4.r),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: BorderRadius.circular(1.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/icons/seat.png',
                    width: 17.w,
                    height: 17.w,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    ticket['category'] as String? ?? '',
                    style: TextStyle(
                      fontSize: 12.sp,
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
      case 'Under Review':
        return Colors.blue.shade700;
      case 'Wait':
      case 'Pending':
        return Colors.orange.shade700;
      default:
        return gray1;
    }
  }

  Widget _logoImg(String path) {
    return Image.asset(
      path,
      width: 44.w,
      height: 44.w,
      fit: BoxFit.contain,
      errorBuilder: (_, __, ___) =>
          Icon(Icons.sports_soccer, size: 36.r, color: darkGreen),
    );
  }
}
