import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pt_prawathiyakarsapradipta/Model/TodoModel.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Services/resources.dart';

class ProviderOperation with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  void setTheme(themeMode) {
    _themeMode = themeMode;
    notifyListeners();
  }

  final _service = TodoService();
  bool isLoading = false;
  List<Todo> _todos = [];
  List<Todo> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();

    final response = await _service.getAll();

    _todos = response;
    isLoading = false;
    notifyListeners();
  }

  Future<bool> createTodos(Todo2 data) async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateTodos(Todo2 data) async {
    String url = 'https://jsonplaceholder.typicode.com/todos/${data.id}';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteTodos(int id) async {
    String url = 'https://jsonplaceholder.typicode.com/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(
      uri,
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
