import 'package:api_homework/home.dart';
import 'package:api_homework/randomadvice.dart';
import 'package:flutter/material.dart';
import 'searchadvice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Advice Slip',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/search': (context) => const SearchAdvice(),
        '/random': (context) => const RandomAdvice(),
      },
    );
  }
}
