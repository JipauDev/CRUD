import 'dart:convert';

class Todo {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  Todo({
    required this.id,
    required this.title,
    required this.userId,
    required this.completed,
  });
}

class Todo2 {
  int id;
  final int userId;
  final String title;
  final bool completed;

  Todo2({
    required this.id,
    required this.title,
    required this.userId,
    required this.completed,
  });

  factory Todo2.fromJson(Map<String, dynamic> map) {
    return Todo2(
        id: map["id"],
        title: map["title"],
        userId: map["userId"],
        completed: map["completed"]);
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "title": title, "userId": userId, "completed": completed};
  }

  @override
  String toString() {
    return 'Todo2{id: $id, title: $title, userId: $userId, completed: $completed}';
  }
}

List<Todo2> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Todo2>.from(data.map((item) => Todo2.fromJson(item)));
}

String profileToJson(Todo2 data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
