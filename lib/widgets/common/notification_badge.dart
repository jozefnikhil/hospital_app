import 'package:amrita_treatment/core/app_colors.dart';
import 'package:amrita_treatment/widgets/common/app_text.dart';
import 'package:flutter/material.dart';

void showErrorBadge(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final entry = OverlayEntry(
    builder: (_) => NotificationBadge(
      message: message,
      icon: Icons.error,
      color: AppColors.white.withValues(alpha: 0.8),
      successorerror: "Error",
    ),
  );

  overlay.insert(entry);

  // Auto-remove after 3 seconds (like Snackbar)
  Future.delayed(const Duration(seconds: 3), () {
    entry.remove();
  });
}

void showSuccessBadge(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  final entry = OverlayEntry(
    builder: (_) => NotificationBadge(
      message: message,
      icon: Icons.check_circle,
      color: AppColors.white.withValues(alpha: 0.8),
      successorerror: "Success",
    ),
  );

  overlay.insert(entry);

  Future.delayed(const Duration(seconds: 2), () {
    entry.remove();
  });
}

class NotificationBadge extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color color;
  final String successorerror;

  const NotificationBadge({
    super.key,
    required this.message,
    required this.icon,
    required this.color,
    required this.successorerror,
  });

  @override
  Widget build(BuildContext context) {
    final double topOffset = MediaQuery.of(context).padding.top;

    return Positioned(
      top: topOffset,
      left: 0,
      right: 0,
      child: Material(
        color: Colors.transparent,
        child: Align(
          alignment: Alignment.topCenter, // You can change position
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text16Normal(
                  text: successorerror,
                  fontWeight: FontWeight.bold,
                  color: AppColors.secondaryTextElement,
                  textAlign: TextAlign.start,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(icon, color: Colors.black),
                    const SizedBox(width: 8),
                    Text14Normal(
                      text: message,
                      color: AppColors.secondaryTextElement,
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
