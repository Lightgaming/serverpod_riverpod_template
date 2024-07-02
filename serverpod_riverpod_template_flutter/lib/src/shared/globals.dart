import 'dart:io';

// Put final values here that are used in multiple places in the app.

/// True if the app is running in test mode.
final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');
