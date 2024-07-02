import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_riverpod_template_flutter/src/shared/providers/shared_preferences_provider.dart';

part 'app_theme_provider.g.dart';

@riverpod

/// A provider that manages the theme mode of the app.
class ThemeModeState extends _$ThemeModeState {
  @override
  ThemeMode build() {
    return ref.read(appSharedPrefsProvider.notifier).getThemeMode();
  }

  /// Sets the theme mode to the provided mode.
  void setTheme(ThemeMode mode) {
    state = mode;
    ref.read(appSharedPrefsProvider.notifier).updateThemeMode(mode);
  }
}

/// A class that statically provides the theme data of the app.
class AppTheme {
  /// Dark theme data of the app
  static ThemeData get darkTheme {
    return ThemeData.dark();
  }

  /// Light theme data of the app
  static ThemeData get lightTheme {
    return ThemeData.light();
  }
}
