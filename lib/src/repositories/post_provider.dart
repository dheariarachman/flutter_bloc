import 'dart:async';
import 'package:fetch_data/src/models/post.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show Client;

class PostProvider {
  Client client = Client();
  final url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> fetchPost() async {
    final response = await client.get(url);
    if (response.statusCode == 200) {
      return compute(postFromJson, response.body);
    } else {
      throw Exception('Error Cannot Fetch');
    }
  }
}