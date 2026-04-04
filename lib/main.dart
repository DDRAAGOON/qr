import 'package:flutter/material.dart';
import 'package:hager/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Ticket',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.welcome,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}