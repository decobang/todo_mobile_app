class TodoItem {
  final String id;
  final String title;
  final String description;
  final DateTime dueDate;
  final bool isDone;

  TodoItem({
    required this.id,
    required this.title,
    this.description = '',
    required this.dueDate,
    this.isDone = false,
  });

  TodoItem copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? dueDate,
    bool? isDone,
  }) {
    return TodoItem(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      dueDate: dueDate ?? this.dueDate,
      isDone: isDone ?? this.isDone,
    );
  }
}