
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'counter_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        
        title: const Text('Riverpod Counter'),
        backgroundColor:
            Theme.of(context).colorScheme.primaryContainer,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Current count value:',
              style: TextStyle(fontSize: 20),
            ),

            Text(
              '$count',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
            child: const Icon(Icons.add),
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () {
              ref.read(counterProvider.notifier).decrement();
            },
            child: const Icon(Icons.remove),
          ),

          const SizedBox(height: 10),

          FloatingActionButton(
            heroTag: 'reset',
            onPressed: () {
              ref.read(counterProvider.notifier).reset();
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
