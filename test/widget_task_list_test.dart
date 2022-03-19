// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:musdoo/task_list.dart';

class OnRemoveMockFunction extends Mock {
  void call(String task);
}

class OnReorderMockFunction extends Mock {
  void call();
}

void main() {
  group('TaskList', () {
    testWidgets('Should render the collection of tasks',
        (WidgetTester tester) async {
      const tasks = ['Task 1', 'Task 2', 'Task 3'];
      await tester.pumpWidget(MaterialApp(
        home: Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: TaskList(tasks: tasks, onRemove: () {}, onReorder: () {}),
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
    const tasks = ['Task 1', 'Task 2', 'Task 3'];
    final onRemove = OnRemoveMockFunction();
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: TaskList(tasks: tasks, onRemove: onRemove, onReorder: () {}),
          ),
        ),
      ),
    ));
    verifyNever(onRemove('Task 1'));
    final taskItem = find.text('Task 1');
    expect(taskItem, findsOneWidget);
    await tester.tap(taskItem);
    await tester.pump();
    verify(onRemove('Task 1')).called(1);
  });
}
