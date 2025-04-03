import 'package:flutter/material.dart';
import 'package:todoapp/features/home/pages/home_page.dart';
import 'package:todoapp/features/home/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Supermercado',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
