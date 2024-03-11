import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mobile_app/models/todo_items_model.dart';
import 'package:todo_mobile_app/models/todo_provider.dart';
import 'package:todo_mobile_app/screens/add_todo_screen.dart';
import 'package:todo_mobile_app/utils/helper_functions.dart';
import 'package:todo_mobile_app/widgets/custom_todo_items.dart';

class ToDoScreen extends ConsumerWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoItem> todoListItems = ref.watch(todoProvider);

    // Sort the todoListItems by due date
    todoListItems.sort((a, b) => a.dueDate.compareTo(b.dueDate));

    return Scaffold(
      appBar: AppBar(
        title: Text(getCurrentDate()),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 1,
      ),
      body: Padding(
          padding: const EdgeInsets.all(2.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return CustomCard(
                  todoItem: todoListItems[index],
                  deleteCallback: () {
                    ref
                        .read(todoProvider.notifier)
                        .remove(todoListItems[index].id);
                  });
            },
            itemCount: todoListItems.length,
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddToDoScreen(),
            ),
          );
        },
        backgroundColor: Colors.black,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
