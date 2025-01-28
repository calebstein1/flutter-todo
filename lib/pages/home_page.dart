import 'package:flutter/material.dart';

import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[200],
      appBar: AppBar(
        title: Text(
          "To Do",
          style: TextStyle(
            color: Colors.grey[100],
          )
        ),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: [
          ToDoTile(
            taskName: "Go shopping",
            taskCompleted: false,
            onChanged: null,
          )
        ]
      )
    );
  }
}