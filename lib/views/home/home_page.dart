import 'package:counter_app/controller/task_cubit.dart';
import 'package:counter_app/views/home/widgets/build_task_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../task/add_task_view.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF192526),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskView(taskMode: TaskMode.add),
            ),
          );
        },
        backgroundColor: const Color(0xFF47B29A),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white, size: 28),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFEAA944),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF47B29A),
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Hadi Heikal',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Today's Tasks",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) {
                    return ListView.builder(
                      itemCount: state.taskList.length,
                      itemBuilder: (context, index) {
                        final currentTask = state.taskList[index];
                        return BuildTaskCard(
                          title: currentTask.taskName,
                          isCompleted: currentTask.isCompleted,
                          onTap: () => context.read<TaskCubit>().toggleTask(
                            currentTask.taskId,
                          ),
                          onEditTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AddTaskView(
                                taskMode: TaskMode.edit,
                                taskId: currentTask.taskId,
                              ),
                            ),
                          ),
                          onRemoveTap: () => context
                              .read<TaskCubit>()
                              .removeTask(currentTask.taskId),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
