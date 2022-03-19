import 'package:flutter/material.dart';
import 'package:musdoo/task_list.dart';

void main() {
  runApp(const MusdooApp());
}

class MusdooApp extends StatelessWidget {
  const MusdooApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Musdoo app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(title: 'Tarefas'),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

void _addNewTask() {}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        child: TaskList(tasks: const [], onRemove: () {}, onReorder: () {}),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewTask();
        },
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
