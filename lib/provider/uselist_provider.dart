import 'package:flutter/material.dart';

import 'package:user_list/model/user_model.dart';
import 'package:user_list/services/userlist_sevice.dart';

class UserProvider extends ChangeNotifier {
  final _service = UserService();
  bool isLoading = false; 
  List<UsersList> _users = [];
  List<UsersList> get user => _users;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _service.getAll();

      if (response.isNotEmpty) {
        _users = response;
      } else {
        
      }
    } catch (e) {
   
      print('Dio Error: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
