import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:serverpod_riverpod_template_flutter/src/main/app.dart';
import 'package:serverpod_riverpod_template_flutter/src/main/app_env.dart';
import 'package:serverpod_riverpod_template_flutter/src/main/observers.dart';
import 'package:serverpod_riverpod_template_flutter/src/shared/providers/app_startup_provider.dart';
import 'package:serverpod_riverpod_template_flutter/src/shared/widgets/app_startup/app_startup_error.dart';
import 'package:serverpod_riverpod_template_flutter/src/shared/widgets/app_startup/app_startup_loading.dart';

/// Widget class to manage asynchronous app initialization
class AppStartupWidget extends ConsumerWidget {
  /// Creates the app startup widget.
  const AppStartupWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // eagerly initialize providers
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
      data: (_) => const App(),
    );
  }
}

void main() => mainCommon(AppEnvironment.prod);

/// Wrapper for main function to reuse with different environments
Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.environment = environment;
  runApp(
    ProviderScope(
      observers: [
        Observers(),
      ],
      child: const AppStartupWidget(),
    ),
  );
}
