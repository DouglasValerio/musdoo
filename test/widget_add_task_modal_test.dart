import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:musdoo/model/task_model.dart';
import 'package:musdoo/pages/homepage.dart';

class OnAddedMockFunction extends Mock {
  void call(TaskModel task);
}

class MockTaskModel extends Mock implements TaskModel {}

void main() {
  group('Add task modal', () {
    testWidgets('Bottom modal should have an TextField & TextButton',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Material(child: Homepage(title: 'Some random title')),
      ));

      final floatingButton = find.byIcon(Icons.add);
      await tester.ensureVisible(floatingButton);
      await tester.pump();
      await tester.tap(floatingButton);
      await tester.pumpAndSettle();
      expect(find.byWidgetPredicate((widget) => widget is TextField),
          findsNWidgets(2));
      expect(find.byWidgetPredicate((widget) => widget is TextButton),
          findsOneWidget);
    });
  });
}
