import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mobile_app/models/todo_items_model.dart';
import 'package:todo_mobile_app/models/todo_provider.dart';
import 'package:uuid/uuid.dart';

class AddTodoDialog extends ConsumerStatefulWidget {
  AddTodoDialog({Key? key}) : super(key: key);

  @override
  _AddTodoDialogState createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends ConsumerState<AddTodoDialog> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      title: const Text('Add New'),
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(hintText: "Title"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Title is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(hintText: "Description"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Description is required';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Add'),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  // Add item to the list
                  ref.read(todoProvider.notifier).add(
                        TodoItem(
                          id: const Uuid().v4(),
                          title: titleController.text,
                          description: descriptionController.text,
                          isDone: false,
                        ),
                      );
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
