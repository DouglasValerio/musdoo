import 'package:flutter/material.dart';

import 'pages/homepage.dart';

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
