import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../widgets/admin_shared_widgets.dart';

class AddMatchScreen extends StatefulWidget {
  const AddMatchScreen({super.key});

  @override
  State<AddMatchScreen> createState() => _AddMatchScreenState();
}

class _AddMatchScreenState extends State<AddMatchScreen> {
  final _compController = TextEditingController();
  final _homeController = TextEditingController();
  final _awayController = TextEditingController();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _priceController = TextEditingController();
  final _quantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: adminGreenAppBar('Add Match', context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            Text(
              'Add New Match',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5.h),
            Text(
              'Fill in the details to schedule a new football match',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 13.sp),
            ),
            SizedBox(height: 24.h),

            // Form Card
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                border: Border.all(
                    color: black.withValues(alpha: 0.1), width: 1.w),
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Column(
                children: [
                  _buildFormField(
                      'Competition (e.g. EPL League)', _compController),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                          child: _buildFormField('Home Team', _homeController)),
                      SizedBox(width: 12.w),
                      Expanded(
                          child: _buildFormField('Away Team', _awayController)),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                          child: _buildFormField(
                        'Match Date',
                        _dateController,
                        hint: 'Select Date',
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null) {
                            setState(() {
                              _dateController.text =
                                  "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                            });
                          }
                        },
                      )),
                      SizedBox(width: 12.w),
                      Expanded(
                          child: _buildFormField(
                        'Match Time',
                        _timeController,
                        hint: 'Select Time',
                        readOnly: true,
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            setState(() {
                              _timeController.text = pickedTime.format(context);
                            });
                          }
                        },
                      )),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    children: [
                      Expanded(
                          child: _buildFormField('Ticket Price', _priceController,
                              hint: '75 EGP')),
                      SizedBox(width: 12.w),
                      Expanded(
                          child: _buildFormField('Available Quantity', _quantityController,
                              hint: '100')),
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
                onPressed: () {
                  if (_homeController.text.isNotEmpty &&
                      _awayController.text.isNotEmpty) {
                    final newMatch = {
                      'comp': _compController.text.isEmpty
                          ? 'EPL'
                          : _compController.text,
                      'time': _timeController.text.isEmpty
                          ? '00:00'
                          : _timeController.text,
                      'date': _dateController.text.isEmpty
                          ? '01/01/2026'
                          : _dateController.text,
                      'team1': _homeController.text,
                      'team2': _awayController.text,
                      'logo1': 'assets/teamfootball/Al_Ahly.png', // Placeholder
                      'logo2': 'assets/teamfootball/Zamalek.png', // Placeholder
                      'price': _priceController.text.isEmpty
                          ? '75 EGP'
                          : _priceController.text,
                      'quantity': _quantityController.text.isEmpty
                          ? '100'
                          : _quantityController.text,
                    };
                    Navigator.pop(context, newMatch);
                  } else {
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkGreen,
                  foregroundColor: white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  elevation: 0,
                ),
                child: Text('Create Match',
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

  Widget _buildFormField(String label, TextEditingController controller,
      {String? hint, bool readOnly = false, VoidCallback? onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500)),
        SizedBox(height: 6.h),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: TextField(
              controller: controller,
              readOnly: readOnly,
              enabled: !readOnly || onTap != null,
              onTap: onTap,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13.sp),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12.sp),
                border: InputBorder.none,
                isDense: true,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
