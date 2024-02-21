part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {}

final class TodoSuccess extends TodoState {
  final List<ToDo> todoList;
  TodoSuccess(this.todoList);
}

final class SuccessResponse extends TodoState{
  final String meassage;
  SuccessResponse(this.meassage);
}

final class TodoFail extends TodoState {
  final String error;
  TodoFail(this.error);
}