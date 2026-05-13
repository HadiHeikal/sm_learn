import 'package:bloc/bloc.dart';
import 'package:counter_app/models/task_model.dart';
import 'package:meta/meta.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  // add task
  void addTask(TaskModel taskModel){
    emit(UpdateTask([...state.taskList, taskModel]));
  }
  // remove task
  void removeTask(int id){
    // making a new list that doesn't contain the removed task
    final List<TaskModel> newList = state.taskList.where((task)=> task.taskId != id).toList();
    emit(UpdateTask(newList));
  }
  // toggle task
  void toggleTask(int id){
    // Iterate at taskList about the task with id and update the value of isCompleted with the help of copyWith func
    final List<TaskModel> newList = state.taskList.map((task)=> task.taskId == id ? task.copyWith(isCompleted: !task.isCompleted): task).toList();
    emit(UpdateTask(newList));
  }
}
