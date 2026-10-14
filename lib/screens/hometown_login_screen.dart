import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/hometown/hometown_components.dart';
import '../theme/hometown_colors.dart';
import '../utils/validators.dart';

class HometownLoginScreen extends StatefulWidget {
  const HometownLoginScreen({super.key});

  @override
  State<HometownLoginScreen> createState() => _HometownLoginScreenState();
}

class _HometownLoginScreenState extends State<HometownLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _userController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showMessage(String text) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(text)));
  }

  void _login() {
    FocusScope.of(context).unfocus();
    if (!_formKey.currentState!.validate()) return;
    _showMessage('Logged in as ${_userController.text.trim()}');
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // Dark status bar icons on the yellow panel.
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: HometownColors.dark,
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CurvedPanel(
                    color: HometownColors.yellow,
                    child: SafeArea(
                      bottom: false,
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 480),
                          child: _buildForm(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: _buildSignUp()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 34, 30, 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'HOMETOWN',
              style: GoogleFonts.quicksand(
                fontSize: 42,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                height: 1.1,
                color: HometownColors.text,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Please Login To Continue',
              style: GoogleFonts.quicksand(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: HometownColors.subtitle,
              ),
            ),
            const SizedBox(height: 32),
            PillTextField(
              controller: _userController,
              hint: 'Email / Username',
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: Validators.emailOrUsername,
            ),
            const SizedBox(height: 16),
            PillTextField(
              controller: _passwordController,
              hint: '**************',
              obscureText: true,
              textInputAction: TextInputAction.done,
              onSubmitted: (_) => _login(),
              validator: Validators.password,
            ),
            const SizedBox(height: 30),
            PillButton(
              label: 'Login',
              background: HometownColors.dark,
              foreground: HometownColors.yellow,
              onTap: _login,
            ),
            const SizedBox(height: 22),
            Align(
              alignment: Alignment.centerLeft,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => _showMessage('Password reset coming soon'),
                  child: Text(
                    'FORGOT PASSWORD ?',
                    style: GoogleFonts.quicksand(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.6,
                      color: HometownColors.text,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUp() {
    return SafeArea(
      top: false,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(44, 40, 44, 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'OR',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 3,
                    color: HometownColors.yellow,
                  ),
                ),
                const SizedBox(height: 30),
                PillButton(
                  label: 'Sign up',
                  background: HometownColors.yellow,
                  foreground: HometownColors.dark,
                  onTap: () => _showMessage('Sign up coming soon'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
