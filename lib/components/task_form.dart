import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist2/components/input_category.dart';
import 'package:todolist2/components/input_date.dart';
import 'package:todolist2/models/task.dart';
import 'package:todolist2/provider/task_provider.dart';

class TaskForm extends StatefulWidget {
  final Task? task;
  const TaskForm({super.key, this.task});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  String? category;
  DateTime? dateController;

  void setDate(DateTime date) {
    dateController = date;
    setState(() {});
  }

  void setCategory(String caregorySelected) {
    category = caregorySelected;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskProvider>(context);

    if (widget.task != null) {
      titleController.text = widget.task!.title;
      descriptionController.text = widget.task!.description;
      dateController = widget.task!.date;
      category = widget.task!.category;
    }

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(label: Text("Título")),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(label: Text("Descrição")),
            ),
            InputCategory(
              category: category,
              setCategory: setCategory,
            ),
            InputDate(
              dateController: dateController,
              onSelectDate: setDate,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                  onPressed: () {
                    if (titleController.text.isEmpty ||
                        descriptionController.text.isEmpty) {
                      return;
                    }

                    provider
                        .save(Task(
                            id: (widget.task != null) ? widget.task!.id : null,
                            category: category!,
                            title: titleController.text,
                            description: descriptionController.text,
                            date: dateController ?? DateTime.now()))
                        .then((value) {
                      Navigator.of(context).pop();
                    });
                  },
                  child: const Text("Salvar Transação")),
            )
          ],
        ),
      ),
    );
  }
}
