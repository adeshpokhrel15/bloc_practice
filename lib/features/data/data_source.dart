import 'dart:convert';

import 'package:bloc_pratical/features/models/data_model.dart';
import 'package:http/http.dart' as http;

class UserDataSource {
  static const url = 'https://jsonplaceholder.typicode.com/posts';

// get User
  Future<List<UserModel>> getUser() async {
    var response = await http.get(Uri.parse(url));
    Iterable userList = json.decode(response.body);
    List<UserModel> users =
        userList.map((user) => UserModel.fromJson(user)).toList();
    return users;
  }

//post user
  Future<void> postUser({
    required int userId,
    required String title,
    required String body,
  }) async {
    final response = await http.post(Uri.parse(url),
        body: jsonEncode({
          'userId': userId,
          'title': title,
          'body': body,
        }),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });

    print(response.body);
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      // print(result);
      result.map((e) => UserModel.fromJson(e)).toList();
    }
  }

  Future<UserModel> updateUser(
      {required String userId,
      required String title,
      required String body,
      required int id}) async {
    final response = await http.put(Uri.parse("$url/$id"),
        body: jsonEncode({
          'userId': userId,
          'title': title,
          'body': body,
        }),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print("$url/$id");
    print(response.body);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body) as Map<String, dynamic>;
      return UserModel.fromJson(result);
    } else {
      throw Exception('Failed to load data');
    }
  }
//update user
  // Future<void> updateUser({
  //   required int userId,
  //   required String title,
  //   required String body,
  //   int? id,
  // }) async {
  //   final response = await http.put(
  //       Uri.parse(
  //         'https://jsonplaceholder.typicode.com/posts/$id}',
  //       ),
  //       headers: {"Content-Type": "application/json"},
  //       body: json.encode({
  //         'userId': userId,
  //         'title': title,
  //         'body': body,
  //       }));
  //   if (response.statusCode == 200) {
  //     final List result = jsonDecode(response.body);
  //     // print(result);
  //     result.map((e) => UserModel.fromJson(e)).toList();
  //   }
  // }

//delete user
  Future<void> deleteUser(int id) async {
    final response = await http
        .delete(Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'));
    if (response.statusCode == 200) {
      print("Successfully");
    } else {
      throw Exception('Failed to load data');
    }
  }
}
