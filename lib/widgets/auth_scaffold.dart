import 'package:flutter/material.dart';
import 'package:flutter_auth_ui_demo/core/theme/tokens.dart';

class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    super.key,
    this.title,
    this.heading,
    this.centerHeading = true,
    this.subtitle,
    this.child,
    this.bottom,
    this.showBack = true,
    this.centerTitle = true,
    this.scrollable = true,
    this.maxContentWidth = double.infinity,
  });

  final String? title;
  final String? heading;
  final bool centerHeading;
  final String? subtitle;
  final Widget? child;
  final Widget? bottom;
  final bool showBack;
  final bool centerTitle;
  final bool scrollable;
  final double maxContentWidth;

  @override
  Widget build(BuildContext context) {
    Widget content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: Tokens.s24, vertical: Tokens.s16),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (heading != null) ...[
                Text(
                  heading!,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: centerHeading ? TextAlign.center : TextAlign.start,
                ),
                const SizedBox(height: Tokens.s8),
              ],
              if (subtitle != null) ...[
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: centerHeading ? TextAlign.center : TextAlign.start,
                ),
                const SizedBox(height: Tokens.s24),
              ],
              if (child != null) child!,
              const SizedBox(height: Tokens.s24),
              if (bottom != null) bottom!,
              const SizedBox(height: Tokens.s16),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: showBack ? const BackButton() : null,
        centerTitle: centerTitle,
        title: title != null ? Text(title!) : null,
      ),
      body: SafeArea(child: scrollable ? SingleChildScrollView(child: content) : content),
    );
  }
}
