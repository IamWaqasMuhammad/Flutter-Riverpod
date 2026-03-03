import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/legacy.dart';

final counter = StateProvider<int>((ref) {
  return 0;
});

final switchProvider = StateProvider<bool>((ref) {
  return false;
});

final checkedProvider = StateProvider<bool>((ref) {
  return false;
});

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('Build 1');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple.withValues(alpha: 2),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer(
              builder: ((context, ref, child) {
                print('Build 2');
                final count = ref.watch(counter);
                return Text(
                  count.toString(),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.blueAccent,
                  ),
                );
              }),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                ref.read(counter.notifier).state++;
              },
              child: Text('Increment'),
            ),
          ),

          SizedBox(height: 50),
          Consumer(
            builder: ((context, ref, child) {
              final switched = ref.watch(switchProvider);
              print('Build 3');
              return Switch(
                value: switched,
                onChanged: (value) {
                  ref.read(switchProvider.notifier).state = value;
                },
              );
            }),
          ),
          Consumer(
            builder: ((context, ref, child) {
              final checked = ref.watch(checkedProvider);
              print('Build 4');
              return Checkbox(
                value: checked,
                onChanged: (value) {
                  ref.read(checkedProvider.notifier).state = value!;
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
