import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_state_management/screens/state_notifier_provider_example.dart';

final counterSateNotifierProvider =
    StateNotifierProvider<CounterTabsStateNotifier, int>(
        (ref) => CounterTabsStateNotifier());

final counterChangeNotifierProvider =
    ChangeNotifierProvider<CounterTabsChangeNotifier>(
        (ref) => CounterTabsChangeNotifier());

class CounterDemoPage extends ConsumerWidget {
  const CounterDemoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final count = ref.watch(counterSateNotifierProvider);
    return Scaffold(
      body: Center(
        child: Text(count.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterSateNotifierProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
