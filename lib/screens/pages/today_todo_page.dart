import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mobile_app/models/todo_items_model.dart';
import 'package:todo_mobile_app/models/todo_provider.dart';
import 'package:todo_mobile_app/screens/pages/add_todo_screen.dart';
import 'package:todo_mobile_app/utils/helper_functions.dart';

class TodayTodoPage extends ConsumerWidget {
  const TodayTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoItem> todoListItems = ref.watch(todoProvider);

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            capitalize(todoListItems[index].title),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          subtitle: Text(
            todoListItems[index].description,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddToDoScreen(
                          isEditingItem: true,
                          itemToEdit: todoListItems[index],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit)),
              IconButton(
                  onPressed: () {
                    ref
                        .read(todoProvider.notifier)
                        .remove(todoListItems[index].id);
                  },
                  icon: const Icon(Icons.delete)),
            ],
          ),
        );
      },
      itemCount: todoListItems.length,
    );
  }
}
