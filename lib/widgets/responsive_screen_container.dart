import 'package:flutter/material.dart';

/// Wraps screen content so it looks good both on:
/// - Mobile portrait (full width, padded)
/// - Web / wide windows (centered card with max width)
class ResponsiveScreenContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;

  const ResponsiveScreenContainer({
    super.key,
    required this.child,
    this.maxWidth = 460,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
