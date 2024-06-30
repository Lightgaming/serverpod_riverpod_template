import 'package:flutter/material.dart';
import 'package:serverpod_riverpod_template_flutter/src/common_widgets/app_layout/app_material_app.dart';
import 'package:serverpod_riverpod_template_flutter/src/common_widgets/app_layout/app_scaffold.dart';

class AppStartupError extends StatelessWidget {
  const AppStartupError({
    super.key,
    required this.message,
    required this.onRetry,
  });

  /// The error message to display
  final String message;

  /// Callback to retry the initialization
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return AppMaterialApp(
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
