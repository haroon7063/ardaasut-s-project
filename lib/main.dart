import 'package:fiverr_project_ardaasut/pages/Login/login_screen.dart';
import 'package:fiverr_project_ardaasut/pages/home/home_page.dart';
import 'package:fiverr_project_ardaasut/pages/question_page/questionScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: QuestionScreen(),
    );
  }
}
