import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../core/router/app_router.dart';
import 'match_management_screen.dart';
import 'payment_receipts_review_screen.dart';
import 'create_account_screen.dart';
import 'manage_account_screen.dart';

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: darkGreen,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text('Admin Home',
            style: TextStyle(
                color: white, fontSize: 18.sp, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: white),
            onPressed: () =>
                Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (_) => false),
          )
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Match Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: const Color(0xff2F322F),
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _badge('EPL', const Color(0x96254DFF)),
                      _badge('Recently', const Color(0x96254DFF)),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Center(
                    child: Text(
                      'Al Ahly vs Zamalek\n15 January 2026\n19:00',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          height: 1.5),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: darkGreen,
                        foregroundColor: white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 36.w, vertical: 10.h),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r)),
                        elevation: 0,
                      ),
                      child: const Text('Details',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            Text('Quick Actions',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),

            SizedBox(height: 14.h),

            // 2x2 Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 1.1,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _QuickAction(
                    icon: Icons.confirmation_number_outlined,
                    iconBg: const Color(0xFFE8EAFF),
                    iconColor: const Color(0xFF5C6BC0),
                    label: 'Match\nManagement',
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const MatchManagementScreen())),
                  ),
                  _QuickAction(
                    icon: Icons.receipt_long_outlined,
                    iconBg: const Color(0xFFF3E5FF),
                    iconColor: const Color(0xFF8E44AD),
                    label: 'Payment\nReceipt Review',
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const PaymentReceiptsReviewScreen())),
                  ),
                  _QuickAction(
                    icon: Icons.person_add_outlined,
                    iconBg: const Color(0xFFE0F7FA),
                    iconColor: const Color(0xFF00838F),
                    label: 'Create\nEmployee &\nCoustmer Account',
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const CreateAccountScreen())),
                  ),
                  _QuickAction(
                    icon: Icons.manage_accounts_outlined,
                    iconBg: const Color(0xFFFFF3E0),
                    iconColor: const Color(0xFFE65100),
                    label: 'Manage Employee\n& Customer\nAccount',
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ManageAccountScreen())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _badge(String label, Color color) => Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(6.r)),
        child: Text(label,
            style: TextStyle(
                color: white, fontSize: 12.sp, fontWeight: FontWeight.w600)),
      );
}

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String label;
  final VoidCallback onTap;
  const _QuickAction(
      {required this.icon,
      required this.iconBg,
      required this.iconColor,
      required this.label,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(14.r),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 42.w,
              height: 42.w,
              decoration: BoxDecoration(
                  color: iconBg, borderRadius: BorderRadius.circular(10.r)),
              child: Icon(icon, color: iconColor, size: 22.r),
            ),
            SizedBox(height: 10.h),
            Text(label,
                style: TextStyle(
                    fontSize: 13.sp, fontWeight: FontWeight.w600, height: 1.3)),
          ],
        ),
      ),
    );
  }
}
