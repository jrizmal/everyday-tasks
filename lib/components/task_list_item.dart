import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';

class TaskListItem extends StatefulWidget {
  final Task task;
  TaskListItem({Key key, this.task}) : super(key: key);

  @override
  _TaskListItemState createState() => _TaskListItemState();
}

class _TaskListItemState extends State<TaskListItem> {
  bool _checked = false;
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.task.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(_getStatus(widget.task)),
              ],
            ),
            Checkbox(
              value: _checked,
              onChanged: (value) {
                setState(() {
                  _checked = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getStatus(Task t) {
    int interval = t.interval;
    String msg =
        interval.toString() + (interval == 1 ? " day" : " days") + " in a row ";
    String emoji = "";

    if (interval <= 1) {
      emoji = "❤";
    }

    if (interval <= 4) {
      emoji = "👌";
    }

    if (interval == 7) {
      emoji = "🎉";
    }

    return msg + emoji;
  }
}
