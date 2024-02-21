import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:todo_jsonplaceholder/model/todo_model/todo_model.dart';

final class TodoDataProvider {
  Future<String> getTodo() async {
    const String apiKey = 'https://jsonplaceholder.typicode.com/todos';
    final Uri uri = Uri.parse(apiKey);
    try {
      final response = await http.get(uri);
      if (response.statusCode != 200) {
        throw 'Something went wrong';
      }
      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> deleteDo(int id) async {
    final String apiKey = 'https://jsonplaceholder.typicode.com/todos/$id';
    final Uri uri = Uri.parse(apiKey);
    try {
      final response = await http.delete(uri);
      if (response.statusCode != 200) {
        log(response.statusCode);
        throw 'Something wentwrong';
      }
      return true;
    } catch (e) {
      throw e.toString();
    }
  }

// "userId": 1,
//     "id": 1,
//     "title": "delectus aut autem",
//     "completed": false

  Future<bool> putTodo(ToDo data) async {
    final String apiKey = 'https://jsonplaceholder.typicode.com/todos/${data.id}';
    final Uri uri = Uri.parse(apiKey);
    final Map body = {
      "userId": 1,
      "id": data.id,
      "title": data.title,
      "completed": data.completed,
    };
    try {
      final response = await http.put(
        uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
      );
      if (response.statusCode != 200) {
        log(response.statusCode);
        throw 'Something wentwrong';
      }
      return true;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<bool> patchTodo(ToDo data) async {
    final String apiKey = 'https://jsonplaceholder.typicode.com/todos/${data.id}';
    final Uri uri = Uri.parse(apiKey);
    final Map body = {
      "title": data.title,
    };
    try {
      final response = await http.patch(
        uri,
        body: jsonEncode(body),
        headers: {'Content-Type': 'application/json; charset=UTF-8'}
      );
      if (response.statusCode != 200) {
        log(response.statusCode);
        throw 'Something wentwrong';
      }
      return true;
    } catch (e) {
      throw e.toString();
    }
  }
}
