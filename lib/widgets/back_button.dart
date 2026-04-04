import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(17, 12, 16, 40),
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: darkGreen,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.chevron_left, color: white, size: 26),
        ),
      ),
    );
  }
}
