import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/provider/search_provider.dart';

class ScreenThree extends ConsumerWidget {
  const ScreenThree({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Three'),
        backgroundColor: Colors.lightGreen,
      ),
      body: Column(
        children: [
          TextFormField(
            onChanged: (value){
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(builder: ((context, ref, child){
            final search = ref.watch((searchProvider).select((state)=> state.search));
            print('Build only search');
            return Text(search);
          })),
          Consumer(builder: ((context, ref, child){
            final isChange = ref.watch((searchProvider).select((state)=> state.isChange));
            print('build only swithc');
            return Switch(value: isChange, onChanged: (value){
              ref.read(searchProvider.notifier).onChange(value);

            });
          }))
        ],
      ),
    );
  }
}
