import 'package:flutter/material.dart';
import 'package:musdoo/model/task_model.dart';

class TaskList extends StatelessWidget {
  const TaskList({Key? key, required this.tasks, required this.onRemove})
      : super(key: key);

  final List<TaskModel> tasks;
  final Function(int) onRemove;

  @override
  Widget build(BuildContext context) {
    List<TaskModel> localTasks = tasks;

    final taskCards = List<Widget>.generate(
      localTasks.length,
      (i) => Card(
        color: Colors.blueGrey[100],
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(localTasks[i].title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(localTasks[i].description),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          primary: Colors.white,
                          backgroundColor: Colors.deepOrange[800]),
                      child: const Text('Remover tarefa'),
                      onPressed: () => onRemove(i),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    return ListView(
      children: [...taskCards],
    );
  }
}
