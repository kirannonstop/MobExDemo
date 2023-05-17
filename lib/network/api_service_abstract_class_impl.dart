import 'dart:async';
import 'dart:convert';

import 'package:first_mobex_flutter_project/network/api_service_abstract_class.dart';
import 'package:http/http.dart' as http;

import '../mobx/models/models.dart';

class MockServiceAbstractClassImpl implements ApiServiceAbstractClass {
  @override
  Future<List<User>> getUserList() async {
    // TODO: implement getUserList
    return [];
  }

  @override
  Future getPostList() async {
    // TODO: implement getPostList
    return [];
  }
}

class ApiServiceAbstractClassImpl implements ApiServiceAbstractClass {
  final http.Client _client;

  ApiServiceAbstractClassImpl(this._client);

  List<User> users = [];
  List<Post> posts = [];

  @override
  Future<List<User>> getUserList() async {
    final response =
        await _client.get(Uri.parse('https://reqres.in/api/users?page=1'));
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
    final response = await _client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
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
