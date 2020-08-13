part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class TaskInitEvent extends TaskEvent{
  
}

class TaskAddEvent extends TaskEvent{
  final Task newTask;
  TaskAddEvent(this.newTask);
}
