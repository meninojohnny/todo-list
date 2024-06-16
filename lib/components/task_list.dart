import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist2/components/task_item.dart';
import 'package:todolist2/provider/task_provider.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return SizedBox(
      child: ListView.builder(
        itemCount: taskProvider.tasks.length,
        itemBuilder: (ctx, index) {
          final task = taskProvider.tasks[index];
          return TaskItem(task: task,
          );
        },
      ),
    );
  }
}
