import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:musdoo/model/task_model.dart';

import 'package:musdoo/widgets/task_list.dart';

class OnRemoveMockFunction extends Mock {
  void call(int i);
}

void main() {
  group('TaskList', () {
    testWidgets('Should render the collection of tasks',
        (WidgetTester tester) async {
      final tasks = [
        TaskModel(
            title: 'Task 1', description: 'description', status: 'status'),
        TaskModel(
            title: 'Task 2', description: 'description', status: 'status'),
        TaskModel(
            title: 'Task 3', description: 'description', status: 'status'),
      ];
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: TaskList(
                tasks: tasks,
                onRemove: (i) {},
              ),
            ),
          ),
        ),
      ));
      expect(find.text('Task 1'), findsOneWidget);
      expect(find.text('Task 2'), findsOneWidget);
      expect(find.text('Task 3'), findsOneWidget);
    });
  });
  testWidgets('Should call the onRemove function', (WidgetTester tester) async {
    final tasks = [
      TaskModel(title: 'Task 1', description: 'description', status: 'status')
    ];
    final onRemove = OnRemoveMockFunction();
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: TaskList(
              tasks: tasks,
              onRemove: onRemove,
            ),
          ),
        ),
      ),
    ));
    verifyNever(onRemove(0));
    final removeTaskButton =
        find.byWidgetPredicate((widget) => widget is TextButton);
    expect(removeTaskButton, findsOneWidget);
    await tester.tap(removeTaskButton);
    await tester.pump();
    verify(onRemove(0)).called(1);
  });
}
