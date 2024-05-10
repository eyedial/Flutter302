import 'package:flutter/material.dart';
import 'screens/ScreenA.dart';
import 'screens/ScreenB.dart';
import 'screens/ScreenMain.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // 처음 띄울 화면 경로
      initialRoute: '/',
      routes: {
        '/': (context) => ScreenMain(),
        '/a': (context) => ScreenA(),
        '/b': (context) => ScreenB(),
      },
    );
  }
}

