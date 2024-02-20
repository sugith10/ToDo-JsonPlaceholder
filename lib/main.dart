import 'package:flutter/material.dart';
import 'package:todo_jsonplaceholder/presentaion/screen/home_screen/homescreen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 48, 54, 48),
          appBarTheme: const AppBarTheme(
            backgroundColor:  Color.fromARGB(255, 48, 54, 48)
          ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 81, 102, 82),
          ),
          fontFamily: 'Protest',
          ),
      home: const HomePage(),
    );
  }
}
