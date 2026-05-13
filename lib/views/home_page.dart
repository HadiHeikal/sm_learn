import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/task_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text('ToDo App', style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xffffffff),
        ),),
      ),
      body: BlocProvider(
        create: (context) => TaskCubit(),
        child: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.teal,

                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
