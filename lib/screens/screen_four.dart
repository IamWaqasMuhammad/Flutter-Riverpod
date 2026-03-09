import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/provider/stream_provider.dart';

class ScreenFour extends ConsumerWidget {
  const ScreenFour({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple, title: Text('Price')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Consumer(
            builder: (context, ref, child) {
              final provider = ref.watch(stackProvider);
              return Center(
                child: provider.when(
                  data: (price) => Text(price.toStringAsFixed(2).toString()),
                  error: (err, stack) => Text('Error: $err'),
                  loading: () => CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
