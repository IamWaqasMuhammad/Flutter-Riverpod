

import 'package:riverpod/legacy.dart';

import '../models/item_models.dart';

final itemProvider = StateNotifierProvider<ItemNotifier, List<ItemModels>>((ref){
  return ItemNotifier();
});


class ItemNotifier extends StateNotifier<List<ItemModels>> {
  ItemNotifier() : super([]);


  void addItem(String name){
    final item = ItemModels(id: DateTime.now().toString(), name: name);
    state.add(item);
    state=state.toList();
  }

  void deleteItem(String id){
    state.removeWhere((item)=> item.id==id);
    state=state.toList();
  }
}