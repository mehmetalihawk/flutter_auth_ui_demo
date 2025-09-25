import 'package:flutter/material.dart';
import 'package:flutter_auth_ui_demo/core/theme/tokens.dart';
import 'package:flutter_auth_ui_demo/widgets/app_text_field.dart';
import 'package:flutter_auth_ui_demo/widgets/auth_scaffold.dart';
import 'package:flutter_auth_ui_demo/widgets/social_row.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  bool rememberMe = false;
  bool obscurePassword = true;

  void _toggleRemember(bool? v) => setState(() => rememberMe = v ?? false);
  void _toggleObscure() => setState(() => obscurePassword = !obscurePassword);

  void _submit() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {}
  }

  String? _emailValidator(String? v) {
    if (v == null || v.trim().isEmpty) return 'Please enter your email';
    final s = v.trim();
    final ok = RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(s);
    if (!ok) return 'Enter a valid email';
    return null;
  }

  String? _passwordValidator(String? v) {
    if (v == null || v.isEmpty) return 'Please enter your password';
    if (v.length < 6) return 'Must be at least 6 characters';
    return null;
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      title: 'Sign In',
      heading: 'Welcome Back',
      subtitle: 'Sign in with your email and password \nor continue with social media',
      scrollable: true,
      maxContentWidth: 480,

      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              label: 'Email',
              hint: 'Enter your email',
              prefixIcon: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              focusNode: _emailFocus,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(_passwordFocus),
              validator: _emailValidator,
            ),
            const SizedBox(height: Tokens.s16),
            AppTextField(
              label: 'Password',
              hint: 'Enter your password',
              prefixIcon: Icons.lock_outline,
              controller: _passwordController,
              focusNode: _passwordFocus,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => _submit(),
              obscureText: obscurePassword,
              onToggleObscure: _toggleObscure,
              validator: _passwordValidator,
            ),
            const SizedBox(height: Tokens.s12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: rememberMe, onChanged: _toggleRemember),
                    const SizedBox(width: Tokens.s8),
                    const Text('Remember me'),
                  ],
                ),
                TextButton(onPressed: () {}, child: const Text('Forgot Password')),
              ],
            ),
          ],
        ),
      ),

      bottom: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: Tokens.s24),
          ElevatedButton(onPressed: _submit, child: const Text('Continue')),
          const SizedBox(height: Tokens.s16),
          SocialRow(onGoogle: () {}, onFacebook: () {}, onTwitter: () {}),
          const SizedBox(height: Tokens.s12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account? "),
              TextButton(onPressed: () {}, child: const Text('Sign Up')),
            ],
          ),
        ],
      ),
    );
  }
}
