import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mobile_app/models/todo_provider.dart';

class ToDoScreen extends ConsumerWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController _pageController = PageController();
    List<String> todoListItems = ref.watch(todoProvider);
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          backgroundColor: Colors.blue.shade300,
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text('Todoy'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: const Text('All'),
                  ),
                )
              ],
            ),
            const Divider(),
            Expanded(
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  Center(
                    child: Text('Todoy'),
                  ),
                  Center(
                    child: Text('All'),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
