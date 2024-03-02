import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mobile_app/models/todo_items_model.dart';
import 'package:todo_mobile_app/models/todo_provider.dart';
import 'package:intl/intl.dart';
import 'package:todo_mobile_app/screens/pages/today_todo_page.dart';
import 'package:todo_mobile_app/screens/pages/add_todo_screen.dart';

class ToDoScreen extends ConsumerWidget {
  const ToDoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PageController pageController = PageController();

    String getCurrentDate() {
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('EEEE, MMMM d').format(now);
      return formattedDate;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(getCurrentDate()),
        backgroundColor: Colors.blue.shade300,
        shadowColor: Colors.black,
        elevation: 1,
      ),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: TextButton(
                  onPressed: () {
                    pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  },
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
                  onPressed: () {
                    pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut);
                  },
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
              controller: pageController,
              children: <Widget>[
                TodayTodoPage(),
                Center(
                  child: Text('All'),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddToDoScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue.shade300,
      ),
    );
  }
}
