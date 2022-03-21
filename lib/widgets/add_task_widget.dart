import 'package:flutter/material.dart';
import 'package:musdoo/model/task_model.dart';

class AddTaskModal extends StatelessWidget {
  final Function(TaskModel) onAdded;
  AddTaskModal({required this.onAdded, Key? key}) : super(key: key);
  final TextEditingController _taskNameController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Text(
              'Adicione uma nova tarefa',
              style: TextStyle(
                  color: Colors.blueGrey[800],
                  fontWeight: FontWeight.w600,
                  fontSize: 24),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: TextField(
              controller: _taskNameController,
              decoration: const InputDecoration(
                label: Text('Nome da tarefa'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey, width: 1),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: TextField(
              minLines: 3,
              maxLines: 10,
              controller: _taskDescriptionController,
              decoration: const InputDecoration(
                label: Text('Descrição da tarefa'),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey, width: 1),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey, width: 1),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              onAdded(TaskModel(
                  title: _taskNameController.text,
                  description: _taskDescriptionController.text,
                  status: 'status'));
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                primary: Colors.blueGrey[100],
                backgroundColor: Colors.blueGrey[800]),
            child: const Text('Adicionar Tarefa'),
          )
        ],
      ),
    );
  }
}
