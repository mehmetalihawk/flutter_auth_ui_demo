import 'package:flutter/material.dart';
import 'package:flutter_auth_ui_demo/core/theme/tokens.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.validator,
    this.onToggleObscure,
  });

  final String? label;
  final String? hint;

  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onFieldSubmitted;

  final String? Function(String?)? validator;

  final VoidCallback? onToggleObscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText,
          validator: validator,
          decoration: InputDecoration(
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            floatingLabelAlignment: FloatingLabelAlignment.start,
            hintText: hint,
            isDense: true,
            prefixIconConstraints: const BoxConstraints(minWidth: Tokens.s40, minHeight: Tokens.s40),
            suffixIconConstraints: const BoxConstraints(minWidth: Tokens.s40, minHeight: Tokens.s40),
            prefixIcon: prefixIcon == null ? null : _CapsuleIcon(icon: prefixIcon!, tooltip: null),
            suffixIcon: onToggleObscure != null
                ? _CapsuleIcon(
                    icon: obscureText ? Icons.visibility_off : Icons.visibility,
                    onTap: onToggleObscure,
                    tooltip: obscureText ? 'Show password' : 'Hide password',
                  )
                : (suffixIcon == null ? null : _CapsuleIcon(icon: suffixIcon!, tooltip: null)),
          ),
        ),
      ],
    );
  }
}

class _CapsuleIcon extends StatelessWidget {
  const _CapsuleIcon({required this.icon, this.onTap, this.tooltip});

  final IconData icon;
  final VoidCallback? onTap;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final iconWidget = Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: const Color(0xFFF5F5F5), borderRadius: BorderRadius.circular(999)),
      child: Icon(icon, size: 20, color: Tokens.hintColor),
    );

    final wrapped = onTap == null
        ? iconWidget
        : InkWell(borderRadius: BorderRadius.circular(999), onTap: onTap, child: iconWidget);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: tooltip == null ? wrapped : Tooltip(message: tooltip!, child: wrapped),
    );
  }
}
