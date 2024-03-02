import 'package:flutter_riverpod/flutter_riverpod.dart';

final todoProvider = StateNotifierProvider<TodoList, List<String>>((ref) => TodoList());

class TodoList extends StateNotifier<List<String>> {
  TodoList() : super([]);

  void add(String item) {
    state = [...state, item];
  }

  void remove(String item) {
    state = state.where((element) => element != item).toList();
  }
}