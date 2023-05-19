import '../mobx/models/models.dart';

//OC LS DI
mixin ApiServiceAbstractClass {
  Future<List<User>> getUserList();

  Future getPostList();
}

mixin MockServiceAbstractClass implements ApiServiceAbstractClass {
  Future getTestCases();
}

abstract class HumanMixin {
  Future getUserList();
}

abstract class BoyMixin extends HumanMixin {
  Future getBarberShopList();
}

abstract class GirlMixin extends HumanMixin {
  Future getParlorShopList();
}

class BoyImpl extends BoyMixin {
  @override
  Future getBarberShopList() async {
    // TODO: implement getBarberShopList
    print("Boy getBarberShopList");
    return [];
  }

  @override
  Future getUserList() async {
    // TODO: implement getUserList
    print("Boy getUserList");
    return [];
  }
}

class GirlImpl implements GirlMixin {
  @override
  Future getParlorShopList() async {
    // TODO: implement getParlorShopList
    print("Girl getParlorShopList");
    return [];
  }

  @override
  Future getUserList() async {
    // TODO: implement getUserList
    print("Girl getUserList");
    return [];
  }
}

abstract class MainStore {
  getData();
}

class BoyStore extends MainStore {
  HumanMixin humanMixin;

  BoyStore(this.humanMixin);

  @override
  void getData() {
    print("Boy getData");
    humanMixin.getUserList();
    (humanMixin as BoyMixin).getBarberShopList();
  }
}

class GirlStore extends MainStore {
  HumanMixin humanMixin;

  GirlStore(this.humanMixin);

  @override
  void getData() {
    print("Girl getData");
    humanMixin.getUserList();
    (humanMixin as GirlMixin).getParlorShopList();
  }
}

void main() {
  //FOR MALE
  MainStore male = BoyStore(BoyImpl());
  male.getData();

  //FOR FEMALE
  MainStore female = GirlStore(GirlImpl());
  female.getData();
}

mixin aaa {
  withDef() {}

  withoutDef();
}

class bb with aaa {
  @override
  withoutDef() {
    // TODO: implement withoutDef
    throw UnimplementedError();
  }
}
