import 'package:mobx/mobx.dart';

import '../../network/api_service_abstract_class.dart';
import '../models/models.dart';

part 'post_store.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  final ApiServiceAbstractClass apiService;

  _PostStore(this.apiService);

  @observable
  ObservableFuture<List<Post>>? postListFuture;

  @action
  fetchPost() {
    postListFuture =
        ObservableFuture(apiService.getPostList().then((posts) => posts));
  }

  void getThePost() {
    fetchPost();
  }
}
