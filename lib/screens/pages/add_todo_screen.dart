import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mobile_app/models/todo_items_model.dart';
import 'package:todo_mobile_app/models/todo_provider.dart';
import 'package:uuid/uuid.dart';

class AddToDoScreen extends ConsumerWidget {
  const AddToDoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
        backgroundColor: Colors.blue.shade300,
        shadowColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Due Date',
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              ref.read(todoProvider.notifier).add(TodoItem(
                    id: const Uuid().v4(),
                    title: 'title',
                    description: 'description',
                    dueDate: DateTime.now(),
                    isDone: false,
                  ));
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }
}
