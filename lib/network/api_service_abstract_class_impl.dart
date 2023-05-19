import 'dart:async';
import 'dart:convert';

import 'package:first_mobex_flutter_project/network/api_service_abstract_class.dart';
import 'package:http/http.dart' as http;

import '../mobx/models/models.dart';

class ApiServiceAbstractClassImpl implements ApiServiceAbstractClass {
  List<User> users = [];
  List<Post> posts = [];

  @override
  Future<List<User>> getUserList() async {
    final response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      users = (data['data'] as List).map((json) {
        return User.fromJSON(json);
      }).toList();
      return users;
    } else {
      print("Error in URL");
      return [];
    }
  }

  @override
  Future getPostList() async {
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

mixin Animal {
  eat();

  sleep();
}
mixin FlyInterface {
  fly();
}

class Bird implements Animal, FlyInterface {
  @override
  eat() {
    // TODO: implement eat
    throw UnimplementedError();
  }

  @override
  fly() {
    // TODO: implement fly
    throw UnimplementedError();
  }

  @override
  sleep() {
    // TODO: implement sleep
    throw UnimplementedError();
  }
}

class Dog implements Animal {
  @override
  eat() {
    // TODO: implement eat
    throw UnimplementedError();
  }

  @override
  sleep() {
    // TODO: implement sleep
    throw UnimplementedError();
  }
}
