import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../router/app_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF0E9E9),
      body: SafeArea(  // إضافة SafeArea هنا
        child: Stack(
          children: [
            // الجزء العلوي مع لون خلفية جديد
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                ),
                child: const Center(
                  child: Text(
                    'QR Ticket',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: darkGreen),
                  ),
                ),
              ),
            ),

            // الكورة الأولى
            Positioned(
              top: 1,
              right: -30,
              child: Image.asset('assets/image/ball.png', width: 100, height: 97),
            ),

            // الأزرار في المنتصف
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.login), // استخدام الثابت
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      backgroundColor: darkGreen,
                    ),
                    child: const Text('Login',
                    style: TextStyle(
                      color: Colors.white
                    )),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.signup), // استخدام الثابت
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(200, 50),
                      backgroundColor: darkGreen,
                    ),
                    child: const Text('Create an account',
                        style: TextStyle(
                            color: Colors.white
                        )),
                  ),
                ],
              ),
            ),

            // النص والأيقونة في الأسفل
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 120),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('- ENJOY EVERY MOMENT -',
                        style: TextStyle(color: Color(0xff0C892D))),
                    const SizedBox(height: 20),
                    const Icon(Icons.arrow_upward, color: darkGreen),
                  ],
                ),
              ),
            ),

            // الكورة الثانية
            Positioned(
              bottom: 1,
              left: 0,
              child: Image.asset('assets/image/ball.png', width: 100, height: 97),
            ),
          ],
        ),
      ),
    );
  }
}
