import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.ralewayTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const Homepage(title: 'Tarefas'),
    );
  }
}
