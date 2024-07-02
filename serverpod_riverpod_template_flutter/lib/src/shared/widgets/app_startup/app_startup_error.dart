import 'package:flutter/material.dart';
import 'package:serverpod_riverpod_template_flutter/src/shared/widgets/app_layout/app_scaffold.dart';

/// A widget to display an error message during app startup.
class AppStartupError extends StatelessWidget {
  /// Creates a new app startup error widget.
  const AppStartupError({
    required this.message,
    required this.onRetry,
    super.key,
  });

  /// The error message to display
  final String message;

  /// Callback to retry the initialization
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Error: $message'),
              ElevatedButton(
                onPressed: onRetry,
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
