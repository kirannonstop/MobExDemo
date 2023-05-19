import '../mobx/models/models.dart';
import 'api_service_abstract_class.dart';

class MockServiceAbstractClassImpl implements ApiServiceAbstractClass {
  @override
  Future getPostList() async {
    // TODO: implement getPostList
    return [];
  }

  @override
  Future<List<User>> getUserList() async {
    // TODO: implement getUserList
    return [];
  }
}
