import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_jsonplaceholder/bloc/todo_bloc.dart';
import 'package:todo_jsonplaceholder/model/todo_model/todo_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TodoBloc>().add(TodoGet());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Todo',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<TodoBloc>().add(TodoGet());
            },
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          if (state is TodoFail) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is! TodoSuccess) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final todoList = state.todoList;
          return ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, index) {
                final todo = todoList[index];
                return ListTile(
                  leading: Text(
                    '${index + 1}.',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 223, 223, 223),
                        fontSize: 25),
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 223, 223, 223),
                      decoration: todo.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationColor: const Color.fromRGBO(244, 67, 54, 1),
                      decorationThickness: 5.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: SizedBox(
                    width: 170,
                    child: Row(
                      children: [
                        IconButton(
                            color: const Color.fromARGB(255, 94, 188, 100),
                            onPressed: () {
                              showDialogBox(todo, 'put');
                            },
                            icon: const CircleAvatar(child: Text('put'))),
                        IconButton(
                            color: const Color.fromARGB(255, 94, 188, 100),
                            onPressed: () {
                              showDialogBox(todo, 'patch');
                            },
                            icon: const CircleAvatar(
                                child: Text(
                              'patch',
                              style: TextStyle(fontSize: 10),
                            ))),
                        IconButton(
                            color: const Color.fromARGB(255, 224, 79, 79),
                            onPressed: () {
                              showDeleteDialogBox(todo);
                            },
                            icon: const CircleAvatar(child: Text('Del'))),
                      ],
                    ),
                  ),
                );
              });
        }),
      ),
    );
  }

  void showDialogBox(ToDo todo, String action) {
    TextEditingController textEditingController = TextEditingController();
    textEditingController.text = todo.title;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 81, 102, 82),
          title: TextField(
            controller: textEditingController,
            style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
            decoration: InputDecoration(
              labelText: 'edit here',
              labelStyle: const TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            cursorColor: Colors.white,
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  todo.title = textEditingController.text;
                  if (action == 'put') {
                    context.read<TodoBloc>().add(TodoUpdate(todo, context));
                  } else if (action == 'patch') {
                    context.read<TodoBloc>().add(TodoEdit(todo, context));
                  }
                },
                child: Center(child: Text(action)))
          ],
        );
      },
    );
  }

  void showDeleteDialogBox(ToDo todo) {
    showDialog(
        context: context,
        builder: (BuildContext _) {
          return AlertDialog(
            title: const Center(child: Text('Delete ToDo')),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                     const SizedBox(
                      width: 20,
                     ),
                  ElevatedButton(
                      onPressed: () {
                        context
                            .read<TodoBloc>()
                            .add(TodoDelete(todo.id, context));
                      },
                      child: const Text('Delete', style: TextStyle(color: Colors.red),))
                ],
              )
            ],
          );
        });
  }
}
