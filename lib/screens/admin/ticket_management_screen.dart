import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../widgets/admin_shared_widgets.dart';

class TicketManagementScreen extends StatefulWidget {
  final Map<String, dynamic>? matchData;
  const TicketManagementScreen({super.key, this.matchData});

  @override
  State<TicketManagementScreen> createState() => _TicketManagementScreenState();
}

class _TicketManagementScreenState extends State<TicketManagementScreen> {
  late final TextEditingController _homeController;
  late final TextEditingController _awayController;
  late final TextEditingController _dateController;
  late final TextEditingController _timeController;
  late final TextEditingController _priceController;
  late final TextEditingController _quantityController;

  @override
  void initState() {
    super.initState();
    _homeController = TextEditingController(
        text: widget.matchData?['team1'] ?? 'Al Ahly FC');
    _awayController = TextEditingController(
        text: widget.matchData?['team2'] ?? 'Zamalek SC');
    _dateController = TextEditingController(
        text: widget.matchData?['date'] ?? '15 December 2026');
    _timeController = TextEditingController(
        text: widget.matchData?['time'] ?? '19:00');
    _priceController = TextEditingController(
        text: widget.matchData?['price'] ?? '75 EGP');
    _quantityController = TextEditingController(
        text: widget.matchData?['quantity'] ?? '100');
  }

  @override
  void dispose() {
    _homeController.dispose();
    _awayController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: adminGreenAppBar('Ticket Management', context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Text(
              'Edit Ticket Prices and Quantities',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.h),
            Text(
              'Update ticket prices and available seats for upcoming matches',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13.sp),
            ),
            SizedBox(height: 24.h),

            // Data Card
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                border: Border.all(
                    color: black.withValues(alpha: 0.1), width: 1.w),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                children: [
                  // Label: EPL League
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color: const Color(0xFFC1FFC1),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Text('EPL League',
                        style: TextStyle(
                            color: darkGreen,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 16.h),

                  Row(
                    children: [
                      Expanded(child: _buildDataField('Home', _homeController)),
                      SizedBox(width: 12.w),
                      Expanded(child: _buildDataField('Away', _awayController)),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  Row(
                    children: [
                      Expanded(child: _buildDataField('Date', _dateController)),
                      SizedBox(width: 12.w),
                      Expanded(child: _buildDataField('Time', _timeController)),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  Row(
                    children: [
                      Expanded(
                          child: _buildDataField('Price', _priceController)),
                      SizedBox(width: 12.w),
                      Expanded(
                          child: _buildDataField(
                              'Available Quantity', _quantityController)),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 40.h),

            SizedBox(
              width: double.infinity,
              height: 52.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkGreen,
                  foregroundColor: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  elevation: 0,
                ),
                child: Text('Save',
                    style: TextStyle(
                        color: white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold)),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildDataField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500)),
        SizedBox(height: 6.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: TextField(
            controller: controller,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13.sp),
            decoration: const InputDecoration(
              border: InputBorder.none,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ],
    );
  }
}

