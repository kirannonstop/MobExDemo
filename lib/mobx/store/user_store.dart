import 'package:first_mobex_flutter_project/mobx/network_service.dart';
import 'package:mobx/mobx.dart';

import '../models/models.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  final NetworkService networkService = NetworkService();

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
      networkService.getData('https://reqres.in/api/users?page=1'),
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
