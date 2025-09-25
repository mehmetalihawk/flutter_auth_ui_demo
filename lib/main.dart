import 'package:flutter/material.dart';
import 'package:flutter_auth_ui_demo/core/theme/app_theme.dart';
import 'package:flutter_auth_ui_demo/core/theme/tokens.dart';
import 'package:flutter_auth_ui_demo/features/auth/sign_in_page.dart';
import 'package:flutter_auth_ui_demo/widgets/app_text_field.dart';
import 'package:flutter_auth_ui_demo/widgets/auth_scaffold.dart';
import 'package:flutter_auth_ui_demo/widgets/social_row.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, theme: appTheme, home: const DemoPage());
  }
}

class DemoPage extends StatelessWidget {
  const DemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SignInPage();
  }
}
