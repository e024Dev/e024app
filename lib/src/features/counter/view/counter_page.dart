import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tcc_flutter_app/src/core/providers/app_providers.dart';
import 'package:tcc_flutter_app/src/features/counter/viewmodel/counter_viewmodel.dart';

class CounterView extends ConsumerWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterViewModelProvider);
    final viewmodel = ref.read(counterViewModelProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
        actions: [
          IconButton(
            onPressed: () => ref.read(darkModeProvider.notifier).update((state) => !state),
            icon: ref.watch(darkModeProvider)
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewmodel.increment(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
