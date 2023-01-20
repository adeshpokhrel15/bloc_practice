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

  Future<List<UserModel>> postUser() async {
    final response = await http.post(Uri.parse(ApiCommon.url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      // print(result);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<UserModel>> updateUser() async {
    final response = await http.put(Uri.parse(ApiCommon.url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      // print(result);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<UserModel>> deleteUser() async {
    final response = await http.delete(Uri.parse(ApiCommon.url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      // print(result);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
