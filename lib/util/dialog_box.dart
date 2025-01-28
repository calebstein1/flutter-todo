import 'package:flutter/material.dart';
import 'package:flutter_todo/util/todo_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.indigo[300],
      content: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ToDoButton(
                    text: "Discard",
                    onPressed: () {

                    }
                ),
                ToDoButton(
                    text: "Save",
                    onPressed:() {

                    }
                ),
              ],
            )
          ]
        )
      )
    );
  }
}