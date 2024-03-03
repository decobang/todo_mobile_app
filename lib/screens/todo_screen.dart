import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mobile_app/models/todo_items_model.dart';
import 'package:todo_mobile_app/models/todo_provider.dart';
import 'package:todo_mobile_app/screens/add_todo_screen.dart';
import 'package:todo_mobile_app/utils/helper_functions.dart';

class ToDoScreen extends ConsumerWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<TodoItem> todoListItems = ref.watch(todoProvider);

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
              return Card(
                elevation: 3,
                shadowColor: Colors.black,
                child: ListTile(
                  visualDensity: VisualDensity.compact,
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        getAbbreviatedDay(todoListItems[index].dueDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        getDayOfMonth(todoListItems[index].dueDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        getAbbreviatedMonth(todoListItems[index].dueDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
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
                ),
              );
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
