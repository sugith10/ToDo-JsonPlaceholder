import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_jsonplaceholder/data/repository_data/repositry_todo_data.dart';
import 'package:todo_jsonplaceholder/model/todo_model/todo_model.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoDataRepository todoDataRepository;

  TodoBloc(this.todoDataRepository) : super(TodoInitial()) {
    on<TodoGet>((event, emit) async {
      emit(TodoLoading());
      try {
        List<ToDo> todoList = await todoDataRepository.getTodo();
        emit(TodoSuccess(todoList));
      } catch (e) {
        emit(TodoFail(e.toString()));
      }
    });

    on<TodoDelete>((event, emit) async {
      try {
       await todoDataRepository.deleteTodo(event.id,event.context );
      
      } catch (e) {
        // emit(TodoFail(e.toString()));
      }
    });

     on<TodoUpdate>((event, emit) async {
      try {
       await todoDataRepository.updateTodo(event.toDo,event.context );
      
      } catch (e) {
        // emit(TodoFail(e.toString()));
      }
    });

     on<TodoEdit>((event, emit) async {
      try {
       await todoDataRepository.editTodo(event.toDo,event.context );
      
      } catch (e) {
        // emit(TodoFail(e.toString()));
      }
    });


  }
}
