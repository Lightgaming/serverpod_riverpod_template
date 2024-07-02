import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_provider.g.dart';

@Riverpod(keepAlive: true)

/// A provider that creates a shared preferences instance.
class AppSharedPrefs extends _$AppSharedPrefs {
  @override
  Future<SharedPreferences> build() {
    return SharedPreferences.getInstance();
  }

  /// Returns the current theme mode.
  ThemeMode getThemeMode() {
    state.whenData((prefs) {
      final themeMode = prefs.getString('themeMode') ?? 'system';
      switch (themeMode) {
        case 'light':
          return ThemeMode.light;
        case 'dark':
          return ThemeMode.dark;
        default:
          return ThemeMode.system;
      }
    });

    return ThemeMode.system;
  }

  /// Updates the theme mode to the provided mode.
  void updateThemeMode(ThemeMode mode) {
    state.whenData((prefs) {
      String themeMode;
      switch (mode) {
        case ThemeMode.light:
          themeMode = 'light';
        case ThemeMode.dark:
          themeMode = 'dark';
        case ThemeMode.system:
          themeMode = 'system';
      }
      prefs.setString('themeMode', themeMode);
    });
  }
}
