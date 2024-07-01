// Generic AsyncValueWidget to work with values of type T
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncValueWidget<T> extends ConsumerWidget {
  const AsyncValueWidget({
    super.key,
    required this.value,
    required this.data,
    required this.future,
  });

  /// input async value
  final AsyncValue<T> value;

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
