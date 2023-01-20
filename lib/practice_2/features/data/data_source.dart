import 'dart:convert';

import 'package:bloc_pratical/practice_2/common/api_common.dart';
import 'package:bloc_pratical/practice_2/features/models/data_model.dart';
import 'package:http/http.dart' as http;

class UserDataSource {
  Future<List<UserModel>> getUser() async {
    final response = await http.get(Uri.parse(ApiCommon.url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      print(result);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
