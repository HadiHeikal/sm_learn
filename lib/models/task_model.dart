import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String taskName ;
  final int taskId ;
  final bool isCompleted ;
  const TaskModel({required this.taskName, required this.taskId ,required this.isCompleted});
  @override

  // Equatable logic
  List<Object?> get props => [taskName,taskId,isCompleted];


  TaskModel copyWith({ String? taskName,  int? taskId, bool? isCompleted}){
    return TaskModel(
        taskName: taskName?? this.taskName ,
        taskId: taskId?? this.taskId,
        isCompleted: isCompleted?? this.isCompleted,
    );
  }
}