import 'package:riverpod/legacy.dart';

final searchProvider = StateNotifierProvider<SearchNotifier, SearchStates>((ref) {
  return SearchNotifier();
});

class SearchNotifier extends StateNotifier<SearchStates> {
  SearchNotifier() : super(SearchStates(search: '',isChange: false));

  void search(String query) {
    state = state.copyWith(search: query);
  }
  void onChange(bool query) {
    state = state.copyWith(isChange: query);
  }
}

class SearchStates {
  final String search;
  final bool isChange;

  SearchStates({required this.search,required this.isChange});

  SearchStates copyWith({String? search, bool? isChange}) {
    return SearchStates(search: search ?? this.search,isChange: isChange??this.isChange);
  }
}
