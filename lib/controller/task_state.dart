part of 'task_cubit.dart';

@immutable
sealed class TaskState {
  final List<TaskModel> taskList;
  const TaskState(this.taskList);
}

final class TaskInitial extends TaskState {
  TaskInitial():super([]);
}

final class UpdateTask extends TaskState {
  const UpdateTask(super.taskList);
}
