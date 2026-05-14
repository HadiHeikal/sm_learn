import 'package:bloc/bloc.dart';
import 'package:counter_app/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitial());
  // add task
  void addTask(String title){
    final taskModel = TaskModel(taskName: title, taskId: Uuid().v4() , isCompleted: false);
    emit(UpdateTask([...state.taskList, taskModel]));
  }
  // remove task
  void removeTask(String id){
    // making a new list that doesn't contain the removed task
    final List<TaskModel> newList = state.taskList.where((task)=> task.taskId != id).toList();
    emit(UpdateTask(newList));
  }
  // toggle task
  void toggleTask(String id){
    // Iterate at taskList about the task with id and update the value of isCompleted with the help of copyWith func
    final List<TaskModel> newList = state.taskList.map((task)=> id == task.taskId ? task.copyWith(isCompleted: !task.isCompleted): task).toList();
    emit(UpdateTask(newList));
  }
  // edit task
  void editTask({required String id,required String newTaskName}){
    final List<TaskModel> newList = state.taskList.map((task)=> id ==task.taskId? task.copyWith(taskName: newTaskName) : task).toList();
    emit(UpdateTask(newList));
  }
}
