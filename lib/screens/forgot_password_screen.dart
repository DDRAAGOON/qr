import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/back_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const CustomBackButton(),
              const Spacer(),
              const Text('Forgot Password?', style: TextStyle(fontSize: 28, color: darkGreen, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const Text(
                'Don\'t worry, it happens. Please enter the address associated with your account.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email ID / Mobile number',
                    prefixIcon: Icon(Icons.alternate_email),
                  ),
                  validator: (value) => value!.isEmpty ? 'Enter email or mobile' : null,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/reset_password');
                  }
                },
                style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                child: const Text('Submit'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
