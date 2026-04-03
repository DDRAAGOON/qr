import 'package:flutter/material.dart';
import '../constants/colors.dart';

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
      prefixIcon: Icon(prefixIcon, color: darkGreen, size: 20),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: const TextStyle(color: darkGreen, fontSize: 14)),
          const Text(' :', style: TextStyle(color: darkGreen, fontSize: 14)),
        ],
      ),
      hintText: hintText,
      hintStyle: const TextStyle(color: darkGreen, fontSize: 13),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: darkGreen, width: 1.5),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: darkGreen, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: darkGreen, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: Colors.red, width: 1.5),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: Colors.red, width: 2),
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
              const SizedBox(height: 12),

              // ── Back button + Header card ──────────────────────────
              Stack(
                clipBehavior: Clip.none,
                children: [
                  // Green header card
                  Container(
                    margin: const EdgeInsets.fromLTRB(16, 50, 16, 0),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      color: darkGreen,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'QR Ticket',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  // Back button (circle) — overlapping top-left
                  Positioned(
                    top: 0,
                    left: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        width: 42,
                        height: 42,
                        decoration: const BoxDecoration(
                          color: darkGreen,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 18),

              // ── Subtitle ──────────────────────────────────────────
              const Text(
                '- ENJOY EVERY MOMENT -',
                style: TextStyle(
                  color: darkGreen,
                  fontSize: 12,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 28),

              // ── Form ──────────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                      const SizedBox(height: 16),

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
                      const SizedBox(height: 16),

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
                      const SizedBox(height: 16),

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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: darkGreen, width: 1.5),
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.calendar_month_outlined,
                                  color: darkGreen, size: 20),
                              const SizedBox(width: 12),
                              const Text(
                                'Date of Birth  :',
                                style: TextStyle(color: darkGreen, fontSize: 14),
                              ),
                              const SizedBox(width: 12),
                              const Icon(Icons.calendar_today_outlined,
                                  color: darkGreen, size: 16),
                              const SizedBox(width: 6),
                              Text(
                                _selectedDate == null
                                    ? 'Y/M/D'
                                    : '${_selectedDate!.year}/${_selectedDate!.month}/${_selectedDate!.day}',
                                style: const TextStyle(
                                    color: darkGreen, fontSize: 13),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

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
                              size: 20,
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
                      const SizedBox(height: 16),

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
                              size: 20,
                            ),
                            onPressed: () => setState(() =>
                            _obscureConfirmPassword = !_obscureConfirmPassword),
                          ),
                        ),
                        validator: (v) =>
                        v == null || v.isEmpty ? 'Please confirm password' : null,
                      ),
                      const SizedBox(height: 32),

                      // SIGN IN button
                      SizedBox(
                        width: 200,
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
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'SIGN IN',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Up arrow at bottom
                      const Icon(Icons.keyboard_arrow_up, color: darkGreen, size: 32),

                      const SizedBox(height: 16),
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