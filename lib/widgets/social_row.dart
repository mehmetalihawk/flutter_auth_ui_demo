import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_auth_ui_demo/core/theme/tokens.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({
    super.key,
    this.onGoogle,
    this.onFacebook,
    this.onTwitter,
    this.spacing = Tokens.s16,
    this.size = Tokens.s44,
    this.showLabels = false,
  });

  final VoidCallback? onGoogle;
  final VoidCallback? onFacebook;
  final VoidCallback? onTwitter;

  final double spacing;
  final double size;
  final bool showLabels;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _SocialCircleButton.svg(
          path: 'assets/icons/google-icon.svg',
          size: size,
          tooltip: 'Continue with Google',
          onPressed: onGoogle,
          label: showLabels ? 'Google' : null,
        ),
        SizedBox(width: spacing),
        _SocialCircleButton.svg(
          path: 'assets/icons/facebook-2.svg',
          size: size,
          tooltip: 'Continue with Facebook',
          onPressed: onFacebook,
          label: showLabels ? 'Facebook' : null,
        ),
        SizedBox(width: spacing),
        _SocialCircleButton.svg(
          path: 'assets/icons/twitter.svg',
          size: size,
          tooltip: 'Continue with Twitter',
          onPressed: onTwitter,
          label: showLabels ? 'Twitter' : null,
        ),
      ],
    );
  }
}

class _SocialCircleButton extends StatelessWidget {
  const _SocialCircleButton._({required this.child, required this.size, this.onPressed, this.tooltip, this.label});

  factory _SocialCircleButton.svg({
    required String path,
    required double size,
    VoidCallback? onPressed,
    String? tooltip,
    String? label,
  }) {
    return _SocialCircleButton._(
      size: size,
      onPressed: onPressed,
      tooltip: tooltip,
      label: label,
      child: SvgPicture.asset(path, width: size * 0.5, height: size * 0.5, fit: BoxFit.contain),
    );
  }

  final Widget child;
  final double size;
  final VoidCallback? onPressed;
  final String? tooltip;
  final String? label;

  @override
  Widget build(BuildContext context) {
    final circle = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        border: Border.all(color: Tokens.borderColor, width: 1.2),
      ),
      child: Center(child: child),
    );

    final tappable = InkWell(borderRadius: BorderRadius.circular(999), onTap: onPressed ?? () {}, child: circle);

    final wrapped = Tooltip(message: (tooltip ?? label ?? '').trim(), child: tappable);

    return Semantics(
      label: (tooltip ?? label ?? 'Social button').trim(),
      button: true,
      enabled: (onPressed ?? () {}) != null,
      child: label == null
          ? wrapped
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                wrapped,
                const SizedBox(width: Tokens.s8),
                Text(label!, style: Theme.of(context).textTheme.bodySmall),
              ],
            ),
    );
  }
}
