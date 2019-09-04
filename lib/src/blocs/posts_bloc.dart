import 'package:fetch_data/src/models/post.dart';
import 'package:fetch_data/src/repositories/repository.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc {
  final _repository = Repository();
  final postFetcher = PublishSubject<List<Post>>();

  Observable<List<Post>> get listPost => postFetcher.stream;

  fetchListPost() async {
    List<Post> post = await _repository.fetchAllPost();
    postFetcher.sink.add(post);
  }
  dispose() {
    postFetcher.close();
  }
}

final postBloc = PostBloc();