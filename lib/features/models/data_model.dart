// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final int userId;
  final int? that;
  final String title;
  final String body;

  UserModel({
    required this.userId,
    this.that,
    required this.title,
    required this.body,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'] ?? '',
      that: json['id'] ?? '',
      title: json['title'],
      body: json['body'],
    );
  }

  Object? toJson() {
    return null;
  }
}

class CommentModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentModel({this.postId, this.id, this.name, this.email, this.body});

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}
