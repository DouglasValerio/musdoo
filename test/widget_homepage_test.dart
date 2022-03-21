import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musdoo/pages/homepage.dart';
import 'package:musdoo/widgets/add_task_widget.dart';
import 'package:musdoo/widgets/task_list.dart';

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
    testWidgets('Should show bottom modal when tap on FloatingButton',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Material(child: Homepage(title: 'Some random title')),
      ));

      final floatingButton = find.byIcon(Icons.add);
      await tester.ensureVisible(floatingButton);
      await tester.pump();
      await tester.tap(floatingButton);
      await tester.pumpAndSettle();
      expect(find.byWidgetPredicate((widget) => widget is AddTaskModal),
          findsOneWidget);
    });
  });
}
