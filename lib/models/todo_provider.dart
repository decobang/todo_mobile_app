import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_mobile_app/models/todo_items_model.dart';

final todoProvider = StateNotifierProvider<TodoList, List<TodoItem>>((ref) => TodoList());

class TodoList extends StateNotifier<List<TodoItem>> {
  TodoList() : super([]);

  void add(TodoItem item) {
    state = [...state, item];
  }

  void remove(String itemId) {
    state = state.where((element) => element.id != itemId).toList();
  }

  void edit(TodoItem item) {
    state = state.map((e) => e.id == item.id ? item : e).toList();
  }
}