class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.completed,
    required this.id,
    required this.title,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      completed: json['completed'],
      id: json['id'],
      title: json['title'],
      userId: json['userId'],
    );
  }
}
