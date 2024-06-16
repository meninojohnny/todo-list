import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist2/components/task_form.dart';
import 'package:todolist2/components/task_list.dart';
import 'package:todolist2/provider/task_provider.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  initState() {
    super.initState();
    Provider.of<TaskProvider>(context, listen: false).load();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return const TaskForm();
        });
  }

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    taskProvider.load();
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
        centerTitle: true,
        backgroundColor: Theme.of(context).focusColor,
        actions: [
          IconButton(
              onPressed: () => _openTransactionFormModal(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: TaskList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTransactionFormModal(context),
        splashColor: Theme.of(context).shadowColor,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
