import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tasks/bloc/task/task_repository.dart';
import 'package:tasks/models/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskRepository _repository = TaskRepository();
  TaskBloc() : super(TaskInitial());

  @override
  Stream<TaskState> mapEventToState(
    TaskEvent event,
  ) async* {
    if(event is TaskInitEvent){
      await _repository.init();
      yield TaskReadyState(await _repository.getTasks());
    }
    else if (event is TaskAddEvent) {
      print(event.newTask.toString());
      /* New event being added */
      await _repository.addTask(event.newTask);
      yield TaskReadyState(await _repository.getTasks());
    }
  }
}
