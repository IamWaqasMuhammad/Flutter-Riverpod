import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/states/app_states.dart';

class ScreenTwo extends ConsumerWidget {
  const ScreenTwo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [
          Consumer(
            builder: ((context, ref, chid) {
              final slider = ref.watch(sliderProvider);
              print('Opacity Build');

              return Container(
                height: 200,
                width: 200,
                color: Colors.deepOrangeAccent.withValues(alpha: slider),
              );
            }),
          ),
          Consumer(
            builder: ((context, ref, child) {
              final slider = ref.watch(sliderProvider);
              print('Slider Build');

              return Slider(
                value: slider,
                onChanged: (value) {
                  final state = ref.read(sliderProvider.notifier);
                  state.state = value;
                },
              );
            }),
          ),
          Consumer(
            builder: ((context, ref, child) {
              final slider = ref.watch(sliderProvider);
              print('Text Build');
              return Text(slider.toString());
            }),
          ),
        ],
      ),
    );
  }
}
