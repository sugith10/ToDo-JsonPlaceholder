import 'package:flutter/material.dart';
import 'package:todo_jsonplaceholder/presentaion/screen/add_screen/add_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => const AddScreen()));
        },
        child: const Icon(
          Icons.add_box_outlined,
          size: 50,
          color: Color.fromARGB(255, 48, 54, 48),
        ),
      ),
    );
  }
}
