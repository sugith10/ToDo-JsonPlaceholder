part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class TodoAdd extends TodoEvent {}

final class TodoGet extends TodoEvent {}

final class TodoDelete extends TodoEvent {}

final class TodoEdit extends TodoEvent {}


