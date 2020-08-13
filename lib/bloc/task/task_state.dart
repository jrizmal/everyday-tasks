part of 'task_bloc.dart';

@immutable
abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskReadyState extends TaskState {
  final List<Task> tasks;
  TaskReadyState(this.tasks);
}
