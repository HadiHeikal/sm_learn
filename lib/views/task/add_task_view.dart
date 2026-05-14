import 'package:counter_app/controller/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
enum TaskMode { add, edit }
class AddTaskView extends StatefulWidget {
  final TaskMode taskMode ;
  final String? taskId;
  final String? initialText;
  const AddTaskView({super.key, required this.taskMode, this.taskId, this.initialText});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.taskMode == TaskMode.edit && widget.initialText != null) {
      textEditingController.text = widget.initialText!;
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF192526),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'New Task',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                Text(
                  widget.taskMode == TaskMode.add ? 'What is your next goal?' : 'Edit Task',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFF233031),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF47B29A).withValues(alpha: 0.6),
                      width: 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF47B29A).withValues(alpha: 0.15),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: TextField(
                    controller: textEditingController,
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    widget.taskMode == TaskMode.add ? 'Enter task title...' : 'Modify task title...',
                    style: const TextStyle(color: Colors.white38, fontSize: 14),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: (){
                    if (textEditingController.text.isNotEmpty) {
                      if (widget.taskMode == TaskMode.add) {
                        // وضع الإضافة
                        context.read<TaskCubit>().addTask(textEditingController.text);
                      } else {
                        context.read<TaskCubit>().editTask(id: widget.taskId!,newTaskName: textEditingController.text);
                      }
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF47B29A),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    elevation: 0,
                  ),
                  child: Text(
                    widget.taskMode == TaskMode.add ? 'Create Task' : 'update task',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
