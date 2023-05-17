import 'package:first_mobex_flutter_project/network/api_service_abstract_class.dart';
import 'package:mobx/mobx.dart';

import '../models/models.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final ApiServiceAbstractClass apiService;

  _UserStore(this.apiService);

  @observable
  ObservableFuture<List<User>>? userListFuture;

/*
  @observable
  User? lastUser;*/

  @computed
  User? get lastComputedUser {
    if (userListFuture != null && userListFuture!.value!.isNotEmpty) {
      return userListFuture!.value!.last;
    }
  }

  @action
  fetchUsers() {
    userListFuture = ObservableFuture(
      apiService.getUserList(),
    ); /*.then(
        (users) {
          /*if (users.isNotEmpty) {
          lastUser = users.last;
        }*/
          return users;
        },*/

    //lastIndex = userListFuture.
  }

  void getTheUsers() {
    fetchUsers();
  }
}
