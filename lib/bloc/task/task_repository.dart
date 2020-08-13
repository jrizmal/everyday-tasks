import 'package:sqflite/sqflite.dart';
import 'package:tasks/models/task.dart';

class TaskRepository {
  TaskRepository() {}

  Future<void> init() async {
    Database database = await openDatabase("test.db", version: 2,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, interval INTEGER)');
    });
  }

  Future<Task> addTask(Task t) async {
    Database db = await openDatabase("test.db");
    int id = await db.insert("tasks", t.toMap());
    t.id = id;
    return t;
  }

  Future<List<Task>> getTasks() async {
    Database db = await openDatabase("test.db");
    List<Map<String, dynamic>> maps = await db.query("tasks",orderBy: "interval");
    List<Task> tasks = List();
    for (Map<String, dynamic> m in maps) {
      tasks.add(Task.fromMap(m));
    }
    return tasks;
  }
}
