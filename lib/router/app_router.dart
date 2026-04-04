import 'package:flutter/material.dart';
import '../screens/forgot_password_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/matches/football_detail_screen.dart';
import '../screens/matches/football_matches_screen.dart';
import '../screens/matches/handball_detail_screen.dart';
import '../screens/matches/handball_matches_screen.dart';
import '../screens/qr_ticket_screen.dart';
import '../screens/reset_password_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/welcome_screen.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/payment_screen.dart';
import '../screens/payment_upload_flow.dart';
import '../screens/admin/admin_dashboard_screen.dart';
import '../screens/admin/admin_login_screen.dart';
import '../screens/admin/admin_tickets_screen.dart';
import '../screens/tickets_history_screen.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String footballMatches = '/matches/football';
  static const String handballMatches = '/matches/handball';
  static const String footballMatchDetail = '/matches/football/detail';
  static const String handballMatchDetail = '/matches/handball/detail';
  static const String qrTicket = '/qr_ticket';
  static const String forgotPassword = '/forgot_password';
  static const String resetPassword = '/reset_password';
  static const String editProfile = '/edit_profile';
  static const String payment = '/payment';
  static const String paymentUpload = '/payment/upload';
  static const String paymentUnderReview = '/payment/under_review';
  static const String adminLogin = '/admin/login';
  static const String adminDashboard = '/admin';
  static const String adminTickets = '/admin/tickets';
  static const String ticketsHistory = '/tickets/history';

  static Map<String, WidgetBuilder> get routes {
    return {
      welcome: (context) => const WelcomeScreen(),
      login: (context) => const LoginScreen(),
      signup: (context) => const SignupScreen(),
      home: (context) => const HomeScreen(),
      footballMatches: (context) => const FootballMatchesScreen(),
      handballMatches: (context) => const HandballMatchesScreen(),
      qrTicket: (context) => const QRTicketScreen(),
      forgotPassword: (context) => const ForgotPasswordScreen(),
      resetPassword: (context) => const ResetPasswordScreen(),
      editProfile: (context) => const EditProfileScreen(),
      payment: (context) {
        final raw = ModalRoute.of(context)?.settings.arguments;
        if (raw is Map<String, dynamic>) {
          return PaymentScreen(
            totalAmount: raw['amount'] as String? ?? '75.00 EGP',
          );
        }
        return const PaymentScreen();
      },
      paymentUpload: (context) => const UploadPaymentScreenshotScreen(),
      paymentUnderReview: (context) => const PaymentUnderReviewScreen(),
      adminLogin: (context) => const AdminLoginScreen(),
      adminDashboard: (context) => const AdminDashboardScreen(),
      adminTickets: (context) => const AdminTicketsScreen(),
      ticketsHistory: (context) => const TicketsHistoryScreen(),
    };
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case footballMatchDetail:
        final match = settings.arguments is Map<String, dynamic>
            ? settings.arguments as Map<String, dynamic>
            : null;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) => FootballDetailScreen(match: match),
        );
      case handballMatchDetail:
        final match = settings.arguments is Map<String, dynamic>
            ? settings.arguments as Map<String, dynamic>
            : null;
        return MaterialPageRoute<void>(
          settings: settings,
          builder: (context) => HandballDetailScreen(match: match),
        );
      default:
        return null;
    }
  }
}
