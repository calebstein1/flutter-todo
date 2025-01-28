import 'package:flutter/material.dart';
import 'package:flutter_todo/util/dialog_box.dart';

import '../util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  List _todoList = [
    ["Go shopping", true],
    ["Exercise", false],
  ];

  void checkBoxChanged(bool? value, int i) {
    setState(() {
      _todoList[i][1] = !_todoList[i][1];
    });
  }

  void saveNewTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todoList.add([_controller.text, false]);
        _controller.clear();
      });
    }
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onDiscard: () {
              Navigator.of(context).pop();
            },
        );
      }
    );
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: _todoList[index][0],
            taskCompleted: _todoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );
        },
      )
    );
  }
}