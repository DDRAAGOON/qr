import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../widgets/admin_shared_widgets.dart';

class TicketManagementScreen extends StatefulWidget {
  const TicketManagementScreen({super.key});

  @override
  State<TicketManagementScreen> createState() => _TicketManagementScreenState();
}

class _TicketManagementScreenState extends State<TicketManagementScreen> {
  final _date     = TextEditingController(text: '15 December 2026');
  final _time     = TextEditingController(text: '19:00');
  final _price    = TextEditingController(text: '75 EGP');
  final _quantity = TextEditingController(text: '100');

  Widget _box(Widget child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400, width: 1.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: adminGreenAppBar('Ticket Management', context),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Edit Ticket Prices and Quantities',
                textAlign: TextAlign.center,
                style:
                    TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 4.h),
            Text('Update ticket prices and available seats for upcoming matches',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 13.sp)),
            SizedBox(height: 24.h),

            // Card
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300, width: 1.w),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                children: [
                  // League tag
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD4EDDA),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Text('EPL League',
                        style: TextStyle(color: darkGreen, fontWeight: FontWeight.w600, fontSize: 12.sp)),
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text('Home',
                                style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                            SizedBox(height: 4.h),
                            _box(Text('Al Ahly FC',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp))),
                          ])),
                      SizedBox(width: 12.w),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text('Away',
                                style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                            SizedBox(height: 4.h),
                            _box(Text('Zamalek SC',
                                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13.sp))),
                          ])),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text('Date',
                                style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                            SizedBox(height: 4.h),
                            _box(Text(_date.text, style: TextStyle(fontSize: 13.sp))),
                          ])),
                      SizedBox(width: 12.w),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text('Time',
                                style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                            SizedBox(height: 4.h),
                            _box(Text(_time.text,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13.sp))),
                          ])),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text('Price',
                                style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                            SizedBox(height: 4.h),
                            _box(Text(_price.text, style: TextStyle(fontSize: 13.sp))),
                          ])),
                      SizedBox(width: 12.w),
                      Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Text('Available Quantity',
                                style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                            SizedBox(height: 4.h),
                            _box(Text(_quantity.text,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13.sp))),
                          ])),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkGreen,
                  foregroundColor: white,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                  elevation: 0,
                ),
                child: Text('Save',
                    style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
