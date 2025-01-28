import 'package:flutter/material.dart';
import 'package:flutter_todo/util/todo_button.dart';

class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onDiscard;
  final VoidCallback onSave;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onDiscard,
    required this.onSave
  });

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
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ToDoButton(
                    text: "Discard",
                    onPressed: onDiscard
                ),
                const SizedBox(width: 8),
                ToDoButton(
                    text: "Save",
                    onPressed: onSave
                ),
              ],
            )
          ]
        )
      )
    );
  }
}