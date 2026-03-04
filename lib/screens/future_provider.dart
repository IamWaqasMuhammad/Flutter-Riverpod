import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/provider/future_provider.dart';

class FutureScreen extends ConsumerWidget {
  const FutureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(futureProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Future Provider'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Center(
        child: provider.when(
          skipLoadingOnRefresh: false,
          data: (data) => ListView.builder(
            itemCount: data.length,
              itemBuilder: (context, index){
            return Center(child: Text(data[index]));
          }),
          error: (error, strace) => Center(child: Text(error.toString())),
          loading: () => CircularProgressIndicator(),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        ref.invalidate(futureProvider);
      },
      child: Icon(CupertinoIcons.refresh),),
    );
  }
}
