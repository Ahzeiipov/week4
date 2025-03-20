import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/course_provider.dart';
import 'repositories/courses_mock_repository.dart';
import 'screens/course_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return const MaterialApp(
    //   debugShowCheckedModeBanner: false,

    //   home: CourseListScreen(),
    // );

    return ChangeNotifierProvider(
      create: (context) => CourseProvider(CoursesMockRepository()),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        title: 'Score App',
        debugShowCheckedModeBanner: false,
        home: const CourseListScreen(),
      ),
    );
  }
}
