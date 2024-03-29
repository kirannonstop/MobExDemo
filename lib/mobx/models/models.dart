class User {
  String? name, email, avatar, id;
  int? followers;

  User({this.name, this.email, this.avatar, this.id, this.followers});

  factory User.fromJSON(Map<String, dynamic> json) {
    return User(
        name: "${json['first_name'].toString()} ${json['last_name'].toString()}",
        email: json['email'].toString(),
        avatar: json['avatar'].toString(),
        id: json['id'].toString(),
        followers: json['id']
    );
  }
}

class Post {
  final String? id, title, body;

  Post({this.id, this.title, this.body});

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
        id: json['id'].toString(),
        title: json['title'],
        body: json['body']
    );
  }
}