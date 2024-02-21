import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_jsonplaceholder/bloc/todo_bloc.dart';
import 'package:todo_jsonplaceholder/data/provider_data/provider_todo_data.dart';
import 'package:todo_jsonplaceholder/data/repository_data/repositry_todo_data.dart';
import 'package:todo_jsonplaceholder/presentaion/screen/home_screen/homescreen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          TodoDataRepository(todoDataProvider: TodoDataProvider()),
      child: BlocProvider(
        create: (context) => TodoBloc(context.read<TodoDataRepository>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 48, 54, 48),

            iconTheme: const IconThemeData(color: Colors.white),
            // iconButtonTheme: IconButtonThemeData(style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.white) )),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Color.fromARGB(255, 81, 102, 82),
            ),
            fontFamily: 'Protest',
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
