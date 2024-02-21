// "userId": 1,
//     "id": 1,
//     "title": "delectus aut autem",
//     "completed": false

final class ToDo {
  final int userId;
  final int id;
   String title;
  final bool completed;

  ToDo(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory ToDo.fromMap(Map<String,dynamic> map){
    return ToDo(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }
}
