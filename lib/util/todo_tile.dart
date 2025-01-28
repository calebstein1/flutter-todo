import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.indigo[300],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              activeColor: Colors.black,
            ),
            Text(
              taskName,
              style: TextStyle(
                color: taskCompleted ? Colors.grey[300] : Colors.grey[100],
                decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none,
              )
            ),
          ],
        ),
      )
    );
  }
}