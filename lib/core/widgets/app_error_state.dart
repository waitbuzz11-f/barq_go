import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppErrorState extends StatelessWidget {
  final String title;
  final String? actionText;
  final VoidCallback? onRetry;
  final VoidCallback? onBack;

  const AppErrorState({
    super.key,
    this.title = 'something_went_wrong',
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
            const Icon(Icons.error_outline, size: 64),
            const SizedBox(height: 16),
            Text(title.tr(), textAlign: TextAlign.center),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: onRetry,
                child: Text((actionText ?? 'retry').tr()),
              ),
            ],
            if (onBack != null) ...[
              const SizedBox(height: 12),
              OutlinedButton(onPressed: onBack, child: Text('back'.tr())),
            ],
          ],
        ),
      ),
    );
  }
}
