// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musdoo/pages/homepage.dart';
import 'package:musdoo/task_list.dart';

void main() {
  group('Homepage', () {
    testWidgets('Should render the Task List Widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Material(child: Homepage(title: 'Some random title')),
      ));
      expect(find.text('Some random title'), findsOneWidget);
      expect(find.byWidgetPredicate((widget) => widget is TaskList),
          findsOneWidget);
    });
    testWidgets('Should render a Floating Action Button',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Material(child: Homepage(title: 'Some random title')),
      ));
      expect(find.byWidgetPredicate((widget) => widget is FloatingActionButton),
          findsOneWidget);
    });
  });
}
