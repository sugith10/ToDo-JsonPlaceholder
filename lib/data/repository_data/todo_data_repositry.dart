import 'dart:convert';

import 'package:todo_jsonplaceholder/data/provider_data/todo_data_provider.dart';
import 'package:todo_jsonplaceholder/model/todo_model/todo_model.dart';

final class TodoDataRepository{
  final TodoDataProvider todoDataProvider;
  TodoDataRepository({required this.todoDataProvider});

  Future <List<ToDo>> getTodo()async{
    try{
      final res = await todoDataProvider.getTodo();
      final data = jsonDecode(res);

      final List<ToDo> todo = data.map((item)=> ToDo.fromMap(data)).toList();
      return todo;
    }catch(e){
      throw e.toString();
    }
  } 
}