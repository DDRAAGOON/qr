import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../widgets/admin_shared_widgets.dart';

class PaymentReceiptsReviewScreen extends StatefulWidget {
  const PaymentReceiptsReviewScreen({super.key});

  @override
  State<PaymentReceiptsReviewScreen> createState() =>
      _PaymentReceiptsReviewScreenState();
}

class _PaymentReceiptsReviewScreenState
    extends State<PaymentReceiptsReviewScreen> {
  final List<Map<String, dynamic>> receipts = [
    {'name': 'Hamza ail',    'email': 'hamzaail249@gmail.com',   'img': 'assets/receipts/1.png', 'status': 'Pending Review'},
    {'name': 'Marwan Ahmed', 'email': 'marooo004@gmail.com',     'img': 'assets/receipts/2.png', 'status': 'Pending Review'},
    {'name': 'Ahmed Ail',    'email': 'ahmedali04@gmail.com',    'img': 'assets/receipts/3.png', 'status': 'Pending Review'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: adminGreenAppBar('Payment Receipts Review', context),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 4.h),
            child: Column(children: [
              Text('Review Customer Requests',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              Text('and approve bank transfers',
                  style: TextStyle(color: Colors.grey, fontSize: 13.sp)),
            ]),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              itemCount: receipts.length,
              itemBuilder: (_, i) {
                final r = receipts[i];
                return Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  padding: EdgeInsets.all(14.r),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade200),
                    borderRadius: BorderRadius.circular(14.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            Text(r['name'],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15.sp)),
                            Text(r['email'],
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12.sp)),
                          ]),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE3F2FD),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text('Pending Review',
                                style: TextStyle(
                                    color: const Color(0xFF1565C0),
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),

                      // Receipt image placeholder
                      Container(
                        height: 160.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xFF333333),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            r['img'],
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Center(
                              child: Icon(Icons.receipt_long,
                                  color: Colors.white54, size: 48.r),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),

                      // Actions
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () =>
                                  setState(() => receipts.removeAt(i)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFCDD2),
                                foregroundColor: Colors.red,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r)),
                              ),
                              child: Text('Reject',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp)),
                            ),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () =>
                                  setState(() => receipts.removeAt(i)),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: darkGreen,
                                foregroundColor: white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r)),
                              ),
                              child: Text('Accept',
                                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
