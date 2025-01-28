import 'package:flutter/material.dart';

class ToDoButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ToDoButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.indigo[400],
      child: Text(text),
    );
  }
}