import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:serverpod_riverpod_template_flutter/src/shared/providers/shared_preferences_provider.dart';

part 'app_startup_provider.g.dart';

@Riverpod(keepAlive: true)

/// A provider that asynchronously initializes other providers.
Future<void> appStartup(AppStartupRef ref) async {
  ref.onDispose(() {
    // ensure we invalidate all the providers we depend on
    ref.invalidate(appSharedPrefsProvider);
  });
  // all asynchronous app initialization code should belong here:
  await ref.watch(appSharedPrefsProvider.future);
}
