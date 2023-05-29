class Todo {
  int? id;
  String text;
  bool completed;

  Todo({
     this.id,
    required this.text,
    this.completed = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'completed': completed ? 1 : 0,
    };
  }

  static Todo fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      text: map['text'],
      completed: map['completed'] == 1,
    );
  }

  //Future<void> copyWith({required int id}) {}
}