import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todolist2/models/task.dart';
import 'package:todolist2/provider/task_provider.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  const TaskItem({super.key, required this.task});

  IconData iconTask() {
    switch (task.category) {
      case "casa":
        return Icons.home;
      case "trabalho":
        return Icons.work;
      case "lazer":
        return Icons.beach_access;
      case "outro":
        return Icons.category_outlined;
      default:
        return Icons.help;
    }
  }

  MaterialColor colorTask() {
    switch (task.category) {
      case "casa":
        return Colors.blue;
      case "trabalho":
        return Colors.green;
      case "lazer":
        return Colors.yellow;
      case "outro":
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);
    return Dismissible(
      key: Key(task.toString()),
      background: Container(
        padding: const EdgeInsets.only(right: 30),
        color: Colors.red,
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (_) => provider.delete(task),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed("/task-view", arguments: task);
        },
        child: Card(
          color: colorTask(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      task.title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy').format(task.date),
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Text(
                  task.description,
                ),
                Icon(iconTask())
              ],
            ),
          ),
        ),
      ),
    );
  }
}
