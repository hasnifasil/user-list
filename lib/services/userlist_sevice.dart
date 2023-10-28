import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:user_list/model/user_model.dart';

class UserService {
  final Dio _dio = Dio();

  Future<List<UsersList>> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    try {
      final response = await _dio.get(url);
      
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        final user = data.map((e) {
          return UsersList(
            id: e['id'],
            title: e['title'],
            userId: e['userId'],
            body: e['body'],
          );
        }).toList();
        print(response);
        return user;
      }
    } catch (e) {
      // Handle any Dio errors here
      print('Dio Error: $e');
    }
    return [];
  }
}
