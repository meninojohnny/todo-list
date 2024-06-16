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

  _openTaskFormModal(BuildContext context) {
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
              onPressed: () => _openTaskFormModal(context),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Niscon Costa | João Vitor | Bruno Silva",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            TaskList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openTaskFormModal(context),
        splashColor: Theme.of(context).shadowColor,
        child: const Icon(Icons.add),
      ),
      // bottomNavigationBar: Container(
      //   padding: EdgeInsets.all(10.0),
      //   color: Colors.grey[200],
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       SizedBox(width: 5.0),
      //       Text(
      //         'Nicson Antunes, Bruno Silva, João Vitor',
      //         style: TextStyle(fontSize: 16.0),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
