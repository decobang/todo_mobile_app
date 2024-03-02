import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mobile_app/models/todo_items_model.dart';
import 'package:todo_mobile_app/models/todo_provider.dart';

class TodayTodoPage extends ConsumerWidget {
  const TodayTodoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoItem> todoListItems = ref.watch(todoProvider);

    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(todoListItems[index].title),
          subtitle: Text(todoListItems[index].description),
          trailing: Checkbox(
            value: todoListItems[index].isDone,
            onChanged: (bool? value) {
              ref.read(todoProvider.notifier).update(
                    todoListItems[index].copyWith(isDone: value),
                  );
            },
          ),
        );
      },
      itemCount: todoListItems.length,
    );
  }
}
