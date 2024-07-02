import 'package:flutter/material.dart';
import 'package:serverpod_riverpod_template_flutter/src/shared/widgets/app_layout/app_scaffold.dart';

/// A widget to display a loading indicator during app startup.
class AppStartupLoading extends StatelessWidget {
  /// Creates a new app startup loading widget.
  const AppStartupLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppScaffold(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
