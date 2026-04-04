import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/bottom_nav.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  static const double actionButtonVerticalPadding = 8;
  static const double actionButtonHorizontalPadding = 14;
  static const double actionButtonFontSize = 13;
  static const double actionButtonBorderRadius = 0;
  static const double actionButtonsRowHorizontalInset = 50;

  /// لون وحجم نص الحقول (Username, Email, …).
  static const TextStyle fieldInputStyle = TextStyle(
    color: darkGreen,
    fontSize: 14,
  );

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool _obscurePassword = true;

  final _usernameController = TextEditingController(text: 'Hamza ail');
  final _emailController = TextEditingController(text: 'hamzaail249@gmail.com');
  final _phoneController = TextEditingController(text: '+20 1234567890');
  final _passwordController = TextEditingController(text: 'evFTbyVVCd');

  final _usernameFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passwordFocus = FocusNode();

  final Set<FocusNode> _clearedOnFocus = {};

  @override
  void initState() {
    super.initState();
    void bind(FocusNode node, TextEditingController c) {
      node.addListener(() {
        if (node.hasFocus && !_clearedOnFocus.contains(node)) {
          _clearedOnFocus.add(node);
          c.clear();
        }
      });
    }

    bind(_usernameFocus, _usernameController);
    bind(_emailFocus, _emailController);
    bind(_phoneFocus, _phoneController);
    bind(_passwordFocus, _passwordController);
  }

  InputDecoration _fieldDecoration({
    required IconData icon,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      prefixIcon: Icon(icon, color: darkGreen, size: 20),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: darkGreen, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: darkGreen, width: 2),
      ),
    );
  }

  ButtonStyle _profileActionButtonStyle(Color background) {
    return ElevatedButton.styleFrom(
      backgroundColor: background,
      foregroundColor: white,
      elevation: 0,
      padding: EdgeInsets.symmetric(
        vertical: EditProfileScreen.actionButtonVerticalPadding,
        horizontal: EditProfileScreen.actionButtonHorizontalPadding,
      ),
      minimumSize: Size.zero,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          EditProfileScreen.actionButtonBorderRadius,
        ),
      ),
      textStyle: TextStyle(
        fontSize: EditProfileScreen.actionButtonFontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _label(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 0),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
      );

  @override
  void dispose() {
    _usernameFocus.dispose();
    _emailFocus.dispose();
    _phoneFocus.dispose();
    _passwordFocus.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: darkGreen,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: white, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(24, 174, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _label('Username'),
            TextField(
              controller: _usernameController,
              focusNode: _usernameFocus,
              style: EditProfileScreen.fieldInputStyle,
              cursorColor: darkGreen,
              decoration: _fieldDecoration(icon: Icons.person_outline),
            ),
            const SizedBox(height: 23),
            _label('Email'),
            TextField(
              controller: _emailController,
              focusNode: _emailFocus,
              style: EditProfileScreen.fieldInputStyle,
              cursorColor: darkGreen,
              keyboardType: TextInputType.emailAddress,
              decoration: _fieldDecoration(icon: Icons.mail_outline),
            ),
            const SizedBox(height: 23),
            _label('Phone Number'),
            TextField(
              controller: _phoneController,
              focusNode: _phoneFocus,
              style: EditProfileScreen.fieldInputStyle,
              cursorColor: darkGreen,
              keyboardType: TextInputType.phone,
              decoration: _fieldDecoration(icon: Icons.phone_outlined),
            ),
            const SizedBox(height: 23),
            _label('Password'),
            TextField(
              controller: _passwordController,
              focusNode: _passwordFocus,
              style: EditProfileScreen.fieldInputStyle,
              cursorColor: darkGreen,
              obscureText: _obscurePassword,
              decoration: _fieldDecoration(
                icon: Icons.lock_outline,
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.remove_red_eye_outlined,
                    color: darkGreen,
                    size: 24,
                  ),
                  onPressed: () =>
                      setState(() => _obscurePassword = !_obscurePassword),
                ),
              ),
            ),
            const SizedBox(height: 47),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: EditProfileScreen.actionButtonsRowHorizontalInset,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: _profileActionButtonStyle(darkGreen),
                      child: const Text('SAVE'),
                    ),
                  ),
                  const SizedBox(width: 45),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: _profileActionButtonStyle(gray1),
                      child: const Text('Cancel'),
                    ),
                  ),
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
