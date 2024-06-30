import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_riverpod_template_flutter/src/common_providers/app_startup_provider.dart';
import 'package:serverpod_riverpod_template_flutter/src/common_widgets/app_startup/app_startup_error.dart';
import 'package:serverpod_riverpod_template_flutter/src/common_widgets/app_startup/app_startup_loading.dart';
import 'package:serverpod_riverpod_template_flutter/src/main_app.dart';

/// Widget class to manage asynchronous app initialization
class AppStartupWidget extends ConsumerWidget {
  const AppStartupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // eagerly initialize appStartupProvider (and all the providers it depends on)
    final appStartupState = ref.watch(appStartupProvider);
    return appStartupState.when(
      // loading state
      loading: () => const AppStartupLoading(),
      // error state
      error: (e, st) => AppStartupError(
        message: e.toString(),
        // invalidate the appStartupProvider
        onRetry: () => ref.invalidate(appStartupProvider),
      ),
      // success - now load the main app
      data: (_) => const MainApp(),
    );
  }
}

void main() {
  runApp(const ProviderScope(child: AppStartupWidget()));
}
