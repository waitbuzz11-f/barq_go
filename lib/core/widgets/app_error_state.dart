import 'package:flutter/material.dart';

class AppErrorState extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onRetry;
  final VoidCallback? onBack;

  const AppErrorState({
    super.key,
    this.title = 'Something went wrong',
    this.actionText,
    this.onRetry,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onRetry,
                child: Text(actionText ?? 'Retry'),
              ),
            ],
            if (onBack != null) ...[
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: onBack,
                child: const Text('Back'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}