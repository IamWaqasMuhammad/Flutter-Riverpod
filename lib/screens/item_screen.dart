import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/provider/item_provider.dart';

class ItemScreen extends ConsumerWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        backgroundColor: Colors.blue,
        elevation: 3,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(itemProvider.notifier).addItem('New Item');
        },
        child: Icon(Icons.add),
      ),
      body: item.isEmpty
          ? Center(child: Text('NO Data Found !!'))
          : ListView.builder(
        itemCount: item.length,
              itemBuilder: (context, index) {
                final itemDetail = item[index];
                return ListTile(
                  title: Text(itemDetail.name),
                  subtitle: Text(itemDetail.id),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(onPressed: (){
                        ref.read(itemProvider.notifier).deleteItem(itemDetail.id);

                      }, icon: Icon(Icons.delete_forever)),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
