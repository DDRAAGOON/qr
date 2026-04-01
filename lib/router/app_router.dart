import 'package:flutter/material.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/match_details_screen.dart';
import '../screens/matches_screen.dart';
import '../screens/qr_ticket_screen.dart';
import '../screens/reset_password_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/welcome_screen.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String footballMatches = '/matches/football';
  static const String handballMatches = '/matches/handball';
  static const String matchDetails = '/match_details';
  static const String qrTicket = '/qr_ticket';
  static const String forgotPassword = '/forgot_password';
  static const String resetPassword = '/reset_password';

  // Map الroutes
  static Map<String, WidgetBuilder> get routes {
    return {
      welcome: (context) => const WelcomeScreen(),
      login: (context) => const LoginScreen(),
      signup: (context) => const SignupScreen(),
      home: (context) => const HomeScreen(),
      footballMatches: (context) => const MatchesScreen(gameType: 'Football'),
      handballMatches: (context) => const MatchesScreen(gameType: 'Handball'),
      matchDetails: (context) => const MatchDetailsScreen(gameType: 'Football'),
      qrTicket: (context) => const QRTicketScreen(),
      forgotPassword: (context) => const ForgotPasswordScreen(),
      resetPassword: (context) => const ResetPasswordScreen(),
    };
  }
}