import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  DateTime? _selectedDate;


  InputDecoration _pillDecoration({
    required IconData prefixIcon,
    required String label,
    Widget? suffixIcon,
    String? hintText,
  }) {
    return InputDecoration(
      prefixIcon: Icon(prefixIcon, color: darkGreen, size: 20.r),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyle(color: darkGreen, fontSize: 14.sp)),
          Text(' :', style: TextStyle(color: darkGreen, fontSize: 14.sp)),
        ],
      ),
      hintText: hintText,
      hintStyle: TextStyle(color: darkGreen, fontSize: 13.sp),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: BorderSide(color: darkGreen, width: 1.5.w),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: BorderSide(color: darkGreen, width: 1.5.w),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: BorderSide(color: darkGreen, width: 2.w),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: BorderSide(color: Colors.red, width: 1.5.w),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50.r),
        borderSide: BorderSide(color: Colors.red, width: 2.w),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 12.h),

              // ── Back button + Header card ──────────────────────────
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Green header card
                  Container(
                    margin: EdgeInsets.fromLTRB(16.w, 50.h, 16.w, 0),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 30.h),
                    decoration: BoxDecoration(
                      color: darkGreen,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Center(
                      child: Text(
                        'QR Ticket',
                        style: TextStyle(
                          fontSize: 40.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1.w,
                        ),
                      ),
                    ),
                  ),
                  // Back button (circle) — overlapping top-left
                  Positioned(
                    top: 0,
                    left: 16.w,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 42.w,
                        height: 42.w,
                        decoration: const BoxDecoration(
                          color: darkGreen,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 26.r,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 18.h),

              // ── Subtitle ──────────────────────────────────────────
              Text(
                '- ENJOY EVERY MOMENT -',
                style: TextStyle(
                  color: darkGreen,
                  fontSize: 12.sp,
                  letterSpacing: 2.5.w,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 28.h),

              // ── Form ──────────────────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Your Name
                      TextFormField(
                        decoration: _pillDecoration(
                          prefixIcon: Icons.person_outline,
                          label: 'Your Name',
                        ),
                        validator: (v) =>
                        v == null || v.isEmpty ? 'Please enter your name' : null,
                      ),
                      SizedBox(height: 16.h),

                      // Email ID
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: _pillDecoration(
                          prefixIcon: Icons.mail_outline,
                          label: 'Email ID',
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Please enter your email';
                          if (!v.contains('@')) return 'Invalid email';
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),

                      // Phone Number
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: _pillDecoration(
                          prefixIcon: Icons.phone_outlined,
                          label: 'Phone Number',
                          hintText: '+20 XXXXXXXXXX',
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Please enter your phone';
                          if (v.length < 10) return 'Invalid phone number';
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),

                      // Date of Birth
                      GestureDetector(
                        onTap: () async {
                          DateTime? picked = await showDatePicker(
                            context: context,
                            initialDate: DateTime(2000),
                            firstDate: DateTime(1950),
                            lastDate: DateTime.now(),
                            builder: (context, child) => Theme(
                              data: Theme.of(context).copyWith(
                                colorScheme: const ColorScheme.light(primary: darkGreen),
                              ),
                              child: child!,
                            ),
                          );
                          if (picked != null) setState(() => _selectedDate = picked);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.w, vertical: 16.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50.r),
                            border: Border.all(color: darkGreen, width: 1.5.w),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.calendar_month_outlined,
                                  color: darkGreen, size: 20.r),
                              SizedBox(width: 12.w),
                              Text(
                                'Date of Birth  :',
                                style: TextStyle(color: darkGreen, fontSize: 14.sp),
                              ),
                              SizedBox(width: 12.w),
                              Icon(Icons.calendar_today_outlined,
                                  color: darkGreen, size: 16.r),
                              SizedBox(width: 6.w),
                              Text(
                                _selectedDate == null
                                    ? 'Y/M/D'
                                    : '${_selectedDate!.year}/${_selectedDate!.month}/${_selectedDate!.day}',
                                style: TextStyle(
                                    color: darkGreen, fontSize: 13.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),

                      // Password
                      TextFormField(
                        obscureText: _obscurePassword,
                        decoration: _pillDecoration(
                          prefixIcon: Icons.lock_outline,
                          label: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined  // مخفي → عين مقفلة
                                  : Icons.remove_red_eye_outlined, // ظاهر → عين مفتوحة
                              color: darkGreen,
                              size: 20.r,
                            ),
                            onPressed: () =>
                                setState(() => _obscurePassword = !_obscurePassword),
                          ),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Please enter password';
                          if (v.length < 6) return 'Min 6 characters';
                          return null;
                        },
                      ),
                      SizedBox(height: 16.h),

                      // Confirm Password
                      TextFormField(
                        obscureText: _obscureConfirmPassword,
                        decoration: _pillDecoration(
                          prefixIcon: Icons.lock_outline,
                          label: 'Confirm Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureConfirmPassword
                                  ? Icons.visibility_off_outlined  // مخفي → عين مقفلة
                                  : Icons.remove_red_eye_outlined, // ظاهر → عين مفتوحة
                              color: darkGreen,
                              size: 20.r,
                            ),
                            onPressed: () => setState(() =>
                            _obscureConfirmPassword = !_obscureConfirmPassword),
                          ),
                        ),
                        validator: (v) =>
                        v == null || v.isEmpty ? 'Please confirm password' : null,
                      ),
                      SizedBox(height: 32.h),

                      // SIGN IN button
                      SizedBox(
                        width: 200.w,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Account created successfully!'),
                                  backgroundColor: darkGreen,
                                ),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkGreen,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.w,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),
                      // Up arrow at bottom
                      Icon(Icons.keyboard_arrow_up, color: darkGreen, size: 32.r),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}