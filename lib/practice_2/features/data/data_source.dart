import 'dart:convert';

import 'package:bloc_pratical/practice_2/common/api_common.dart';
import 'package:bloc_pratical/practice_2/features/models/data_model.dart';
import 'package:http/http.dart' as http;

class UserDataSource {
  Future<List<UserModel>> getUser() async {
    final response = await http.get(Uri.parse(ApiCommon.url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      // print(result);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<UserModel>> postUser({
    required String userId,
    required String title,
    required String body,
  }) async {
    final response = await http.post(Uri.parse(ApiCommon.url),
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
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}

// class CommentDataSource {
//   final String userId;
//   CommentDataSource(this.userId);
//   Future<List<UserModel>> getComment() async {
//     final response = await http.get(Uri.parse(
//         'https://jsonplaceholder.typicode.com/posts/$userId/comments'));
//     if (response.statusCode == 200) {
//       final List result = jsonDecode(response.body)[0];
//       print(result);
//       // print(result);
//       return result.map((e) => UserModel.fromJson(e)).toList();
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }
//}
