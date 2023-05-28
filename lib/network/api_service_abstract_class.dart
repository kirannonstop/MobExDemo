import 'dart:convert';

import 'package:http/http.dart' as http;

import '../mobx/models/models.dart';

//OC LS DI
mixin ApiServiceAbstractClass {
  Future<List<User>> getUserList();

  Future getPostList();
}

abstract class SchoolProtocol {
  Future getData();
}

class StudentImpl extends SchoolProtocol {
  List<User> students = [];

  @override
  getData() async {
    // TODO: implement getData
    print("THIS IS STUDENT INFO");
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      students = (data['data'] as List).map((json) {
        return User.fromJSON(json);
      }).toList();
      return students;
    } else {
      print("Error in URL");
      return [];
    }
  }
}

class TeacherImpl extends SchoolProtocol {
  List<Post> posts = [];

  @override
  getData() async {
    // TODO: implement getData
    print("THIS IS TEACHER INFO");
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      posts = (data as List).map((json) {
        return Post.fromJSON(json);
      }).toList();
      return posts;
    } else {
      print("Error in URL");
    }
  }
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
