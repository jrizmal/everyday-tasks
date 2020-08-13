class Task {
  int id;
  String title;
  int interval;

  Task({this.id, this.title, this.interval});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "interval": interval,
    };
  }

  Task.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    title = map["title"];
    interval = map["interval"];
  }

  @override
  String toString() {
    return this.toMap().toString();
  }
}
