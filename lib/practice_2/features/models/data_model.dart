// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final int userId;
  final int that;
  final String title;
  final String body;
  UserModel({
    required this.userId,
    required this.that,
    required this.title,
    required this.body,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json['userId'],
      that: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
