// Generic AsyncValueWidget to work with values of type T
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// A widget that simplifies the handling of async values.
class AsyncValueWidget<T> extends ConsumerWidget {
  /// Creates a new async value widget.
  const AsyncValueWidget({
    required this.value,
    required this.data,
    required this.future,
    super.key,
  });

  /// input async value
  final AsyncValue<T> value;

  /// The future to refresh the value
  /// Use it like `ref.refresh(provider.future)`
  final Refreshable<Future<T>> future;

  /// output builder function
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshIndicator(
      onRefresh: () => ref.refresh(future),
      child: value.when(
        data: data,
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Text(
            e.toString(),
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.red),
          ),
        ),
      ),
    );
  }
}
