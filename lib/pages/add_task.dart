import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:tasks/bloc/task/task_bloc.dart';
import 'package:tasks/components/custom_button.dart';
import 'package:tasks/components/header.dart';
import 'package:tasks/models/task.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key key}) : super(key: key);

  @override
  _AddTaskPageState createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  int _pickerValue = 1;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titleTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add new task"),
        ),
        /* floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            BlocProvider.of<TaskBloc>(context)
                .add(TaskAddEvent(Task(interval: 2, title: "Jaka")));
          },
        ), */
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomHeader(
                  text: "Name your task",
                ),
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  controller: _titleTextController,
                  textAlign: TextAlign.center,
                  validator: (value) {
                    if (value.length < 3) {
                      return 'Please enter at leat 3 characters';
                    }
                    return null;
                  },
                ),
                CustomHeader(
                  text: "Choose an interval (days)",
                ),
                NumberPicker.integer(
                  initialValue: _pickerValue,
                  scrollDirection: Axis.vertical,
                  minValue: 1,
                  maxValue: 7,
                  onChanged: (newValue) =>
                      setState(() => _pickerValue = newValue),
                ),
                CustomButton(
                  text: "Ok",
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      BlocProvider.of<TaskBloc>(context).add(
                        TaskAddEvent(
                          Task(
                              interval: _pickerValue,
                              title: _titleTextController.text),
                        ),
                      );
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          ),
        ));
  }
}
