import 'dart:convert';

import 'package:riverpod_state_management/models/user.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<UserModel>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body);
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
