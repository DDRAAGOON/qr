import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/constants/colors.dart';
import '../../core/services/receipts_service.dart';

class PaymentReceiptsReviewScreen extends StatefulWidget {
  const PaymentReceiptsReviewScreen({super.key});

  @override
  State<PaymentReceiptsReviewScreen> createState() =>
      _PaymentReceiptsReviewScreenState();
}

class _PaymentReceiptsReviewScreenState
    extends State<PaymentReceiptsReviewScreen> {
  final ReceiptsService _service = ReceiptsService();

  void _accept(int index) {
    setState(() => _service.removeReceiptAt(index));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Payment accepted ✓'),
        backgroundColor: darkGreen,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _reject(int index) {
    setState(() => _service.removeReceiptAt(index));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Payment rejected'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final receipts = _service.receipts;

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: darkGreen,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: white, size: 28.r),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Payment Receipts Review',
          style: TextStyle(
            color: white,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.r),
            bottomRight: Radius.circular(20.r),
          ),
        ),
      ),
      body: receipts.isEmpty
          ? Center(
              child: Text(
                'No pending reviews',
                style: TextStyle(color: Colors.grey, fontSize: 16.sp),
              ),
            )
          : Column(
              children: [
                // ── Subtitle ──────────────────────────────────────
                Padding(
                  padding: EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 12.h),
                  child: Column(
                    children: [
                      Text(
                        'Review Customer Requests',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        'and approve bank transfers',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                // ── List ──────────────────────────────────────────
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                    itemCount: receipts.length,
                    itemBuilder: (context, i) {
                      return _ReceiptCard(
                        receipt: receipts[i],
                        onAccept: () => _accept(i),
                        onReject: () => _reject(i),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}

// ── Receipt Card ──────────────────────────────────────────────────
class _ReceiptCard extends StatelessWidget {
  final ReceiptModel receipt;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  const _ReceiptCard({
    required this.receipt,
    required this.onAccept,
    required this.onReject,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: Colors.grey.shade300, width: 1.w),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Padding(
        padding: EdgeInsets.all(14.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header row ──────────────────────────────────────
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Name + email
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      receipt.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      receipt.email,
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                // Pending badge
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCEEFF),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    receipt.status,
                    style: TextStyle(
                      color: const Color(0xFF1565C0),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 14.h),

            // ── Receipt Screenshot ───────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                width: double.infinity,
                height: 250.h,
                color: const Color(0xFF2A2A2A),
                child: _buildImage(),
              ),
            ),

            SizedBox(height: 14.h),

            // ── Action Buttons ───────────────────────────────────
            Row(
              children: [
                // Reject
                Expanded(
                  child: ElevatedButton(
                    onPressed: onReject,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFCDD2),
                      foregroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 13.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Reject',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 12.w),

                // Accept
                Expanded(
                  child: ElevatedButton(
                    onPressed: onAccept,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: darkGreen,
                      foregroundColor: white,
                      padding: EdgeInsets.symmetric(vertical: 13.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Accept',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (receipt.memoryImg != null) {
      return Image.memory(
        receipt.memoryImg!,
        fit: BoxFit.cover,
      );
    } else if (receipt.assetImg != null) {
      return Image.asset(
        receipt.assetImg!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _buildPlaceholder(),
      );
    }
    return _buildPlaceholder();
  }

  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.receipt_long, color: Colors.white38, size: 52.r),
        SizedBox(height: 8.h),
        Text(
          'Receipt Screenshot',
          style: TextStyle(color: Colors.white38, fontSize: 13.sp),
        ),
      ],
    );
  }
}

