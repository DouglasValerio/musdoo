import 'package:flutter/material.dart';
import 'package:musdoo/model/task_model.dart';

import '../widgets/add_task_widget.dart';
import '../widgets/task_list.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<TaskModel> _tasks = [];
  void _addNewTask() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(24), topLeft: Radius.circular(24)),
      ),
      builder: (context) => AddTaskModal(
        key: const Key('add_widget_modal'),
        onAdded: (task) {
          setState(() {
            _tasks.add(task);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        child: TaskList(
          tasks: _tasks,
          onRemove: (i) {
            setState(() {
              _tasks.removeAt(i);
            });
          },
        ),
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
