// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_jsonplaceholder/data/provider_data/provider_todo_data.dart';
import 'package:todo_jsonplaceholder/model/todo_model/todo_model.dart';

final class TodoDataRepository {
  final TodoDataProvider todoDataProvider;
  TodoDataRepository({required this.todoDataProvider});

  Future<List<ToDo>> getTodo() async {
    try {
      final res = await todoDataProvider.getTodo();
      final List<dynamic> data = jsonDecode(res);
      print(data);
      final List<ToDo> todo = data.map((item) => ToDo.fromMap(item)).toList();
      return todo;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteTodo(int id, BuildContext context) async {
    try {
      final bool success = await todoDataProvider.deleteDo(id);
      if (!success) {
        log('Delete request failed');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Delete request failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
      log('Delete request success');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Delete request success',
            style: TextStyle(letterSpacing: 1),
          ),
          backgroundColor: Colors.green,
        ),
      );
      // return 'Request Success';
    } catch (e) {
      log('error: $e');
      throw e.toString();
    }
  }

  Future<void> updateTodo(ToDo todo, BuildContext context) async {
    try {
      final bool success = await todoDataProvider.putTodo(todo);
      Navigator.pop(context);
      if (!success) {
        log('put request failed');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('put request failed'),
            backgroundColor: Colors.red,
          ),
        );
        
      }
      log('put request success');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'put request success',
            style: TextStyle(letterSpacing: 1),
          ),
          backgroundColor: Colors.green,
        ),
      );
      // return 'Request Success';
    } catch (e) {
      log('error: $e');
      throw e.toString();
    }
  }

  Future<void> editTodo(ToDo todo, BuildContext context) async {
    try {
      final bool success = await todoDataProvider.patchTodo(todo);
      Navigator.pop(context);
      if (!success) {
        log('patch request failed');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('patch request failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
      log('patch request success');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'patch request success',
            style: TextStyle(letterSpacing: 1),
          ),
          backgroundColor: Colors.green,
        ),
      );
      // return 'Request Success';
    } catch (e) {
      log('error: $e');
      throw e.toString();
    }
  }


}
