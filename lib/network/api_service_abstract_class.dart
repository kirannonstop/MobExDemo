import '../mobx/models/models.dart';

abstract class ApiServiceAbstractClass {
  Future<List<User>> getUserList();

  Future getPostList();
}
