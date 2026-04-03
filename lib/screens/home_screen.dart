import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/bottom_nav.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 553,
              height: 382,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image/stadium.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Image.asset('assets/image/football.png', width: 432, height: 383),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 400),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/matches/football'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50), backgroundColor: darkGreen),
                  child: const Text('FOOTBALL'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/matches/handball'),
                  style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50), backgroundColor: darkGreen),
                  child: const Text('HANDBALL'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(minimumSize: const Size(250, 50), backgroundColor: darkGreen),
                  child: const Text('OTHER GAMES'),
                ),
                const SizedBox(height: 50),
                const Text('- ENJOY EVERY MOMENT -', style: TextStyle(color: darkGreen)),
              ],
            ),
          ),
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNav(),
    );
  }
}
