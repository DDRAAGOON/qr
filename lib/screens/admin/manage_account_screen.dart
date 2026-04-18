import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/constants/colors.dart';
import '../../widgets/admin_shared_widgets.dart';
import 'create_account_screen.dart';

class ManageAccountScreen extends StatefulWidget {
  const ManageAccountScreen({super.key});

  @override
  State<ManageAccountScreen> createState() => _ManageAccountScreenState();
}

class _ManageAccountScreenState extends State<ManageAccountScreen> {
  int _tab = 0; // 0=Customer, 1=Employee

  final List<Map<String, dynamic>> customers = [
    {'name': 'Hamza ail',    'email': 'hamzaail249@gmail.com',   'blocked': false},
    {'name': 'Marwan Ahmed', 'email': 'marooo004@gmail.com',     'blocked': true},
    {'name': 'Ahmed ail',    'email': 'ahmedali04@gmail.com',    'blocked': false},
    {'name': 'Sara Alaa',    'email': 'saraalaaaa8899@gmail.com','blocked': true},
  ];

  final List<Map<String, dynamic>> employees = [
    {'name': 'Basant Wael',   'email': 'besool212@gmail.com'},
    {'name': 'Hamza EL Gamal','email': 'hezo04@gmail.com'},
    {'name': 'Ahmed Yasser',  'email': 'ya121204@gmail.com'},
    {'name': 'Koleb Ahmed',   'email': 'koah230@gmail.com'},
    {'name': 'Khaled Ashraf', 'email': 'kheleoo00@gmail.com'},
    {'name': 'Malak Waleed',  'email': 'mokaed00@gmail.com'},
  ];

  @override
  Widget build(BuildContext context) {
    final isCustomer = _tab == 0;
    final title = isCustomer ? 'Manage Customer Account' : 'Manage Employee Account';

    return Scaffold(
      backgroundColor: white,
      appBar: adminGreenAppBar(title, context),
      body: Column(
        children: [
          SizedBox(height: 14.h),
          // Toggle
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ToggleBtn(label: 'Customer', active: _tab == 0, onTap: () => setState(() => _tab = 0)),
              SizedBox(width: 10.w),
              _ToggleBtn(label: 'Employee', active: _tab == 1, onTap: () => setState(() => _tab = 1)),
            ],
          ),
          SizedBox(height: 14.h),

          // List
          Expanded(
            child: isCustomer
                ? _buildCustomerList()
                : _buildEmployeeList(),
          ),

          // Create Account button
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const CreateAccountScreen())),
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkGreen,
                  foregroundColor: white,
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r)),
                  elevation: 0,
                ),
                child: Text('Create Account',
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerList() => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: customers.length,
        itemBuilder: (_, i) {
          final c = customers[i];
          return Container(
            margin: EdgeInsets.only(bottom: 12.h),
            padding: EdgeInsets.all(12.r),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(c['name'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp)),
                      Text(c['email'],
                          style: TextStyle(
                              color: Colors.grey, fontSize: 12.sp)),
                    ]),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: c['blocked']
                            ? const Color(0xFFFFEBEE)
                            : const Color(0xFFD4EDDA),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        c['blocked'] ? 'Blocked' : 'Active',
                        style: TextStyle(
                            color: c['blocked'] ? Colors.red : darkGreen,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(children: [
                  _actionBtn(
                    c['blocked'] ? 'Unblock' : 'Block',
                    c['blocked'] ? const Color(0xFFD4EDDA) : const Color(0xFFFFCDD2),
                    c['blocked'] ? darkGreen : Colors.red,
                    () => setState(() => c['blocked'] = !c['blocked']),
                  ),
                  SizedBox(width: 10.w),
                  _actionBtn('Remove', Colors.grey.shade200, Colors.grey.shade700, () {
                    setState(() => customers.removeAt(i));
                  }),
                ]),
              ],
            ),
          );
        },
      );

  Widget _buildEmployeeList() => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: employees.length,
        itemBuilder: (_, i) {
          final e = employees[i];
          return Container(
            margin: EdgeInsets.only(bottom: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(e['name'],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.sp)),
                    Text(e['email'],
                        style: TextStyle(
                            color: Colors.grey, fontSize: 12.sp)),
                  ]),
                ),
                IconButton(
                  icon: Icon(Icons.delete_outline, color: Colors.red, size: 24.r),
                  onPressed: () => setState(() => employees.removeAt(i)),
                ),
              ],
            ),
          );
        },
      );

  Widget _actionBtn(String label, Color bg, Color fg, VoidCallback onTap) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
          decoration: BoxDecoration(
              color: bg, borderRadius: BorderRadius.circular(8.r)),
          child: Text(label,
              style: TextStyle(
                  color: fg, fontSize: 13.sp, fontWeight: FontWeight.w500)),
        ),
      );
}

class _ToggleBtn extends StatelessWidget {
  final String label;
  final bool active;
  final VoidCallback onTap;
  const _ToggleBtn({required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: active ? darkGreen : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Text(label,
              style: TextStyle(
                  color: active ? white : Colors.grey.shade700,
                  fontWeight: FontWeight.w600,
                  fontSize: 13.sp)),
        ),
      );
}
