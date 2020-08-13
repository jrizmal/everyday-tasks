import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks/bloc/task/task_bloc.dart';
import 'package:tasks/components/task_list_item.dart';
import 'package:tasks/models/task.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_horiz),
            onPressed: () {
              Navigator.of(context).pushNamed("settings");
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed("add_task");
        },
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskInitial) {
            BlocProvider.of<TaskBloc>(context).add(TaskInitEvent());
            return Center(
              child: CircularProgressIndicator(
                value: null,
              ),
            );
          } else if (state is TaskReadyState) {
            /* build list here */
            return _buildTaskList(state.tasks);
          }
          return Center(
            child: CircularProgressIndicator(
              value: null,
            ),
          );
        },
      ),
    );
  }

  Widget _buildTaskList(List<Task> tasks) {
    /* Group tasks and add dividers */
    // tasks.sort((a, b) => a.interval.compareTo(b.interval));
    int currentInterval = 0;
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final Task t = tasks[index];

        if (currentInterval != t.interval) {
          currentInterval = t.interval;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,8),
                  child: Text(
                    "Every "+(t.interval==1?" day":t.interval.toString()+" days"),
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                TaskListItem(
                  task: t,
                )
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TaskListItem(
            task: t,
          ),
        );
      },
    );
  }
}
