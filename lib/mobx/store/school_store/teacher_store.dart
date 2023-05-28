import 'package:first_mobex_flutter_project/network/api_service_abstract_class.dart';
import 'package:mobx/mobx.dart';

import '../../models/models.dart';

part 'teacher_store.g.dart';

class TeacherStore = _TeacherStore with _$TeacherStore;

abstract class _TeacherStore with Store {
  final SchoolProtocol schoolProtocol;

  _TeacherStore({required this.schoolProtocol});

  @observable
  ObservableFuture<List<Post>>? postListFuture;

  @action
  fetchPost() {
    postListFuture =
        ObservableFuture(schoolProtocol.getData().then((posts) => posts));
  }

  void getThePost() {
    fetchPost();
  }
}
