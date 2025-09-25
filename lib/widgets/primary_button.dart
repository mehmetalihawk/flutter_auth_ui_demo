import 'package:flutter/material.dart';
import 'package:flutter_auth_ui_demo/core/theme/tokens.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.leadingIcon,
    this.expand = true,
    this.size = ButtonSize.medium,
    this.semanticsLabel,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final IconData? leadingIcon;
  final bool expand;
  final ButtonSize size;
  final String? semanticsLabel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expand ? double.infinity : null,
      height: (size == ButtonSize.small
          ? Tokens.s44
          : size == ButtonSize.medium
          ? Tokens.s52
          : Tokens.s56),
      child: Semantics(
        label: semanticsLabel ?? label,
        enabled: (isDisabled || isLoading) ? false : true,
        button: true,
        child: ElevatedButton(
          onPressed: (isDisabled || isLoading) ? null : onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading == true)
                const SizedBox(
                  width: Tokens.s20,
                  height: Tokens.s20,
                  child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                )
              else if (leadingIcon != null)
                Icon(leadingIcon),
              if (isLoading || leadingIcon != null) const SizedBox(width: Tokens.s12),
              Text(label, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}

enum ButtonSize { small, medium, large }
