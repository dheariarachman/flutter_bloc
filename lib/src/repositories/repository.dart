import 'dart:async';
import 'package:fetch_data/src/models/post.dart';
import 'package:fetch_data/src/repositories/post_provider.dart';

class Repository {
  final postProvider = PostProvider();

  Future<List<Post>> fetchAllPost() => postProvider.fetchPost();
}