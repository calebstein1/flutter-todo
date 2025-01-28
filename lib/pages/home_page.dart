import 'package:flutter/material.dart';
import 'package:flutter_todo/data/database.dart';
import 'package:flutter_todo/util/dialog_box.dart';
import 'package:flutter_todo/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    db.loadData();

    super.initState();
  }

  void checkBoxChanged(int i) {
    setState(() {
      db.todoList[i][1] = !db.todoList[i][1];
    });
    db.updateDatabase();
  }

  void saveNewTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        db.todoList.add([_controller.text, false]);
        _controller.clear();
      });
    }
    Navigator.of(context).pop();
    db.updateDatabase();
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

  void deleteTask(int i) {
    setState(() {
      db.todoList.removeAt(i);
    });
    db.updateDatabase();
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
        itemCount: db.todoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todoList[index][0],
            taskCompleted: db.todoList[index][1],
            onChanged: (value) => checkBoxChanged(index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      )
    );
  }
}