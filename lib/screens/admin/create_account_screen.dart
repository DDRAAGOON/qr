import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../widgets/admin_shared_widgets.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _obscureCustPass    = true;
  bool _obscureCustConfirm = true;
  bool _obscureEmpPass     = true;
  bool _obscureEmpConfirm  = true;
  DateTime? _dob;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: adminGreenAppBar('Create Employee & Customer Account', context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Customer Account ─────────────────────────────────
            Text('Customer Account',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 14.h),

            TextField(decoration: adminPillDec(icon: Icons.person_outline, hint: 'Your Name  :')),
            SizedBox(height: 12.h),
            TextField(decoration: adminPillDec(icon: Icons.mail_outline, hint: 'Email ID  :')),
            SizedBox(height: 12.h),
            TextField(
              keyboardType: TextInputType.phone,
              decoration: adminPillDec(
                  icon: Icons.phone_outlined,
                  hint: 'Phone Number :  +20 XXXXXXXXXX'),
            ),
            SizedBox(height: 12.h),

            // DOB picker
            GestureDetector(
              onTap: () async {
                final d = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000),
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                    builder: (ctx, child) => Theme(
                        data: Theme.of(ctx).copyWith(
                            colorScheme:
                                const ColorScheme.light(primary: darkGreen)),
                        child: child!));
                if (d != null) setState(() => _dob = d);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.h),
                decoration: BoxDecoration(
                  border: Border.all(color: darkGreen, width: 1.4.w),
                  borderRadius: BorderRadius.circular(50.r),
                ),
                child: Row(children: [
                   Icon(Icons.person_outline, color: darkGreen, size: 18.r),
                   SizedBox(width: 10.w),
                  Text(
                    _dob == null
                        ? 'Date of Birth :    Y/M/D'
                        : 'Date of Birth :    ${_dob!.year}/${_dob!.month}/${_dob!.day}',
                    style: TextStyle(color: darkGreen, fontSize: 13.sp),
                  ),
                   const Spacer(),
                   Icon(Icons.calendar_today_outlined,
                      color: darkGreen, size: 16.r),
                ]),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              obscureText: _obscureCustPass,
              decoration: adminPillDec(
                icon: Icons.lock_outline,
                hint: 'Password  :',
                suffix: IconButton(
                    icon: Icon(
                        _obscureCustPass
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        color: darkGreen,
                        size: 18.r),
                    onPressed: () =>
                        setState(() => _obscureCustPass = !_obscureCustPass)),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              obscureText: _obscureCustConfirm,
              decoration: adminPillDec(
                icon: Icons.lock_outline,
                hint: 'Confirm Password  :',
                suffix: IconButton(
                    icon: Icon(
                        _obscureCustConfirm
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        color: darkGreen,
                        size: 18.r),
                    onPressed: () => setState(
                        () => _obscureCustConfirm = !_obscureCustConfirm)),
              ),
            ),
            SizedBox(height: 20.h),
            Center(child: adminGreenSaveBtn('Save', () {})),

            SizedBox(height: 20.h),
            const Divider(thickness: 1),
            SizedBox(height: 20.h),

            // ── Employee Account ─────────────────────────────────
            Text('Employee Account',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 14.h),
            TextField(decoration: adminPillDec(icon: Icons.person_outline, hint: 'Your Name  :')),
            SizedBox(height: 12.h),
            TextField(decoration: adminPillDec(icon: Icons.mail_outline, hint: 'Email ID  :')),
            SizedBox(height: 12.h),
            TextField(
              obscureText: _obscureEmpPass,
              decoration: adminPillDec(
                icon: Icons.lock_outline,
                hint: 'Password  :',
                suffix: IconButton(
                    icon: Icon(
                        _obscureEmpPass
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        color: darkGreen,
                        size: 18.r),
                    onPressed: () =>
                        setState(() => _obscureEmpPass = !_obscureEmpPass)),
              ),
            ),
            SizedBox(height: 12.h),
            TextField(
              obscureText: _obscureEmpConfirm,
              decoration: adminPillDec(
                icon: Icons.lock_outline,
                hint: 'Confirm Password  :',
                suffix: IconButton(
                    icon: Icon(
                        _obscureEmpConfirm
                            ? Icons.remove_red_eye_outlined
                            : Icons.visibility_off_outlined,
                        color: darkGreen,
                        size: 18.r),
                    onPressed: () =>
                        setState(() => _obscureEmpConfirm = !_obscureEmpConfirm)),
              ),
            ),
            SizedBox(height: 20.h),
            Center(child: adminGreenSaveBtn('Save', () {})),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
