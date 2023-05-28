import 'package:first_mobex_flutter_project/network/api_service_abstract_class.dart';
import 'package:mobx/mobx.dart';

import '../../models/models.dart';

part 'student_store.g.dart';

class StudentStore = _StudentStore with _$StudentStore;

abstract class _StudentStore with Store {
  final SchoolProtocol schoolProtocol;

  _StudentStore({required this.schoolProtocol});

  @observable
  ObservableFuture<List<User>>? userListFuture;

  @computed
  User? get lastComputedUser {
    if (userListFuture != null && userListFuture!.value!.isNotEmpty) {
      return userListFuture!.value!.last;
    }
  }

  @action
  fetchUsers() {
    userListFuture = ObservableFuture(
      schoolProtocol.getData().then((user) => user),
    );
  }

  void getTheUsers() {
    fetchUsers();
  }
}
