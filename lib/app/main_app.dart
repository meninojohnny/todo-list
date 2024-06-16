import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist2/pages/main_page.dart';
import 'package:todolist2/pages/task_view_screen.dart';
import 'package:todolist2/provider/task_provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TaskProvider(),
      child: MaterialApp(
        title: "Expenses",
        theme: ThemeData(
          colorSchemeSeed: const Color.fromARGB(255, 251, 64, 64),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          "/": (_) => MainPage(),
          "/task-view": (_) => const TaskViewScreen()
        },
      ),
    );
  }
}
