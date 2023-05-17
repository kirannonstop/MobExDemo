import 'package:first_mobex_flutter_project/mobx/models/models.dart';
import 'package:first_mobex_flutter_project/mobx/network_service.dart';
import 'package:mobx/mobx.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  final NetworkService networkService = NetworkService();

  @observable
  ObservableFuture<List<Post>>? postListFuture;

  @action
  fetchPost() {
    postListFuture = ObservableFuture(networkService
        .getPosts('https://jsonplaceholder.typicode.com/posts')
        .then((posts) => posts));
  }

  void getThePost() {
    fetchPost();
  }
}
