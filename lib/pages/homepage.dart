import 'package:flutter/material.dart';

import '../task_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> _tasks = [];
  void _addNewTask() {
    final String task = 'Task ${_tasks.length + 1}';
    setState(() {
      _tasks.add(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        child: TaskList(tasks: _tasks, onRemove: () {}, onReorder: () {}),
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
