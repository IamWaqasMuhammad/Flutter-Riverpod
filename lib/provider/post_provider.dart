import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/post_model.dart';
import '../repo/post_repository.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return PostRepository();
});

final postProvider = FutureProvider<Post>((ref) async {
  final repo = ref.read(postRepositoryProvider);
  return repo.fetchPosts();
});