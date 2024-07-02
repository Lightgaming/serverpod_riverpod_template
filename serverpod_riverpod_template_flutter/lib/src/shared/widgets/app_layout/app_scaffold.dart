import 'package:flutter/material.dart';

/// A scaffold for the app.
class AppScaffold extends StatelessWidget {
  /// Creates a new app scaffold.
  const AppScaffold({
    required this.child,
    super.key,
    this.floatingActionButton,
  });

  /// The child (body) widget to display in the scaffold.
  final Widget child;

  /// A button displayed floating above [child], in the bottom right corner.
  final FloatingActionButton? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      floatingActionButton: floatingActionButton,
    );
  }
}
