import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';
import '../admin/admin_home_screen.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
// 0 = Admin Login, 1 = Employee Login

  InputDecoration _pillDecoration({
    required IconData prefixIcon,
    required String hint,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      prefixIcon: Icon(prefixIcon, color: darkGreen, size: 20.r),
      hintText: hint,
      hintStyle: TextStyle(color: darkGreen, fontSize: 14.sp),
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

              // ── Top Row: Back + Tabs ──────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    // Back button circle
                    GestureDetector(
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
                    const Spacer(),
                    // Admin Login Tab
                    // Employee Login Tab
                  ],
                ),
              ),

              SizedBox(height: 16.h),

              // ── Green Header Card ─────────────────────────────────
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 28.h),
                decoration: BoxDecoration(
                  color: darkGreen,
                  borderRadius: BorderRadius.circular(28.r),
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

              SizedBox(height: 20.h),

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

              SizedBox(height: 40.h),

              // ── Form ──────────────────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.w),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Email Field
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: _pillDecoration(
                          prefixIcon: Icons.mail_outline,
                          hint: 'Email ID',
                        ),
                        validator: (v) =>
                        v == null || v.isEmpty ? 'Please enter your email' : null,
                      ),

                      SizedBox(height: 16.h),

                      // Password Field
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obscurePassword,
                        decoration: _pillDecoration(
                          prefixIcon: Icons.lock_outline,
                          hint: 'Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.remove_red_eye_outlined,
                              color: darkGreen,
                              size: 20.r,
                            ),
                            onPressed: () => setState(
                                    () => _obscurePassword = !_obscurePassword),
                          ),
                        ),
                        validator: (v) =>
                        v == null || v.isEmpty ? 'Please enter your password' : null,
                      ),
                      SizedBox(height: 28.h),
                      // LOG IN Button
                      SizedBox(
                        width: 200.w,
                        child: ElevatedButton(
                          onPressed: () {
                            // ... (onPressed logic remains same)
                              if (_formKey.currentState!.validate()) {
                                if (_emailController.text.trim() == 'admin@admin.com' &&
                                    _passwordController.text == 'admin123') {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (_) => const AdminHomeScreen()),
                                  );
                                } else if (_emailController.text.trim() == 'staff@staff.com' &&
                                    _passwordController.text == 'staff123') {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    AppRoutes.staffScanTicket,
                                  );
                                } else {
                                  Navigator.pushNamed(context, AppRoutes.home);
                                }
                              }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: darkGreen,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'LOG IN',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      // Forgot Password
                      Column(
                        children: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, AppRoutes.forgotPassword),
                            child: Text(
                              'Forgot your password?',
                              style: TextStyle(
                                color: darkGreen,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                          Container(
                            height: 1.5.h,
                            width: 160.w,
                            color: darkGreen,
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),

                      // OR Divider
                      Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: darkGreen.withOpacity(0.3),
                              thickness: 1.h,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: darkGreen,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: darkGreen.withOpacity(0.3),
                              thickness: 1.h,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      // Google Sign In Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Image.asset(
                            'assets/icons/google.png',
                            height: 24.w,
                            width: 24.w,
                            errorBuilder: (context, error, stackTrace) =>
                                Icon(Icons.g_mobiledata, size: 28.r, color: darkGreen),
                          ),
                          label: Text(
                            'Continue with Google',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.0.w,
                              color: darkGreen,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 14.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            side: BorderSide(color: darkGreen, width: 1.5.w),
                          ),
                        ),
                      ),

                      SizedBox(height: 40.h),
                      // SIGN IN Outlined Button
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, AppRoutes.signup),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: darkGreen,
                            padding: EdgeInsets.symmetric(vertical: 16.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            side: BorderSide(color: darkGreen, width: 1.5.w),
                          ),
                          child: Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5.w,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      // Up Arrow
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: darkGreen,
                        size: 36.r,
                      ),
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