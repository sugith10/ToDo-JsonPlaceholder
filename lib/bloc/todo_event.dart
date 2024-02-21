part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

final class TodoAdd extends TodoEvent {}

final class TodoGet extends TodoEvent {}

final class TodoDelete extends TodoEvent {
  final int id;
  final BuildContext context;
  TodoDelete(this.id, this.context);
}

final class TodoUpdate extends TodoEvent{
  final ToDo toDo;
  final BuildContext context;
  TodoUpdate(this.toDo, this.context);
}

final class TodoEdit extends TodoEvent {
  final ToDo toDo;
  final BuildContext context;
  TodoEdit(this.toDo, this.context);
}
