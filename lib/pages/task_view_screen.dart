import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolist2/components/task_form.dart';
import 'package:todolist2/models/task.dart';

class TaskViewScreen extends StatefulWidget {
  const TaskViewScreen({super.key});

  @override
  State<TaskViewScreen> createState() => _TaskViewScreenState();
}

class _TaskViewScreenState extends State<TaskViewScreen> {
  @override
  Widget build(BuildContext context) {
    final task = ModalRoute.of(context)?.settings.arguments as Task;

    _openTransactionFormModal(BuildContext context) {
      showModalBottomSheet(
          context: context,
          builder: (_) {
            return TaskForm(task: task,);
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: const Icon(Icons.edit))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Titulo: ${task.title}"),
            Text("Data: ${DateFormat("dd/MM/yyy").format(task.date)}"),
            Text("Descrição: ${task.description}"),
            Text("Categoria: ${task.category}"),
          ],
        ),
      ),
    );
  }
}