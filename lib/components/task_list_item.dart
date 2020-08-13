import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';

class TaskListItem extends StatefulWidget {
  final Task task;
  TaskListItem({Key key, this.task}) : super(key: key);

  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.orange[100],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.task.title),
            Text(_getStatus(widget.task)),
          ],
        ),
      ),
    );
  }

  String _getStatus(Task t) {
    int interval = t.interval;

    if (interval <= 1) {
      return "Keep it up ❤";
    }

    if (interval <= 4) {
      return "Looking good 👌";
    }

    if (interval == 7) {
      return "That's a week! 🎉";
    }

    return "Going strong 🔥";
  }
}
