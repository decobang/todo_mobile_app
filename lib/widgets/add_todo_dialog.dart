import 'package:flutter/material.dart';

class AddTodoDialog extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add a new todo'),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: "Enter todo here"),
      ),
      actions: [
        TextButton(
          child: Text('Add'),
          onPressed: () {
            // Add your todo here
            Navigator.of(context).pop(controller.text);
          },
        ),
      ],
    );
  }
}