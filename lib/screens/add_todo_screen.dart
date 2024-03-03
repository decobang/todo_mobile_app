import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mobile_app/models/todo_items_model.dart';
import 'package:todo_mobile_app/models/todo_provider.dart';
import 'package:uuid/uuid.dart';

class AddToDoScreen extends ConsumerWidget {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isEditingItem;
  TodoItem? itemToEdit;
  DateTime dueDate = DateTime.now();

  AddToDoScreen({super.key, this.isEditingItem = false, this.itemToEdit});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isEditingItem) {
      titleController.text = itemToEdit!.title;
      descriptionController.text = itemToEdit!.description;
      dueDate = itemToEdit!.dueDate;
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('New Task'),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 1,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 24),
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    // 'Title cannot be empty
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    errorStyle: TextStyle(
                        color:
                            Colors.black), // Change this to your desired color
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'title cannot be empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                TextFormField(
                  controller: descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                    errorStyle: TextStyle(
                        color:
                            Colors.black), // Change this to your desired color
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 100,
                  child: DatePicker(
                    DateTime.now(),
                    initialSelectedDate: itemToEdit?.dueDate ?? DateTime.now(),
                    selectionColor: Colors.blue,
                    selectedTextColor: Colors.white,
                    onDateChange: (date) {
                      dueDate = date;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          onPressed: () {
            if (formKey.currentState!.validate()) {
              if (!isEditingItem) {
                ref.read(todoProvider.notifier).add(TodoItem(
                      id: const Uuid().v4(),
                      title: titleController.text,
                      description: descriptionController.text,
                      dueDate: dueDate,
                      isDone: false,
                    ));
                Navigator.pop(context);
              } else {
                ref.read(todoProvider.notifier).edit(TodoItem(
                      id: itemToEdit!.id,
                      title: titleController.text,
                      description: descriptionController.text,
                      dueDate: dueDate,
                      isDone: false,
                    ));
                Navigator.pop(context);
              }
            }
          },
          child: const Icon(Icons.save),
        ));
  }
}
