import 'package:flutter/material.dart';
import 'package:project2/screens/intro_screen.dart';
import 'package:project2/screens/tasks_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project2/screens/shared_preference.dart';

void main() async {
  await Hive.initFlutter("hive_box");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: 'intro',
      routes: {
        'intro': (context) => const IntroPage(),
        'tasks': (context) => const TasksPage(),
        'shared': (context) => SplashScreen(),
      },
    );
  }
}
