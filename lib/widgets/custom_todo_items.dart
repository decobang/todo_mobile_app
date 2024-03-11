import 'package:flutter/material.dart';
import 'package:todo_mobile_app/models/todo_items_model.dart';
import 'package:todo_mobile_app/screens/add_todo_screen.dart';
import 'package:todo_mobile_app/utils/helper_functions.dart';

class CustomCard extends StatelessWidget {
  final TodoItem todoItem;
  final Function deleteCallback;

  CustomCard({required this.todoItem, required this.deleteCallback});

  @override
  Widget build(BuildContext context) {
    final DateTime currentDueDate = DateTime.now();
    return Dismissible(
      key: Key(todoItem.id),
      onDismissed: (direction) {
        deleteCallback();
      },
      background: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.red,
          ),
          alignment: Alignment.centerRight,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("Remove", style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
      child: GestureDetector(
        onLongPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddToDoScreen(
                isEditingItem: true,
                itemToEdit: todoItem,
              ),
            ),
          );
        },
        child: Card(
          child: ListTile(
            visualDensity: VisualDensity.compact,
            leading: currentDueDate.day == todoItem.dueDate.day
                ? const Icon(
                    Icons.event,
                    color: Colors.lightBlue,
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        getAbbreviatedDay(todoItem.dueDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        getDayOfMonth(todoItem.dueDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        getAbbreviatedMonth(todoItem.dueDate),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
            title: Text(
              capitalize(todoItem.title),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
            subtitle: Text(
              todoItem.description,
              style: const TextStyle(
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
