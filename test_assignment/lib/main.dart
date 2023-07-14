import 'package:flutter/material.dart';
import 'package:test_assignment/features/logIn/presentation/pages/login_page.dart';

import 'features/search/presentation/pages/search_page.dart';
import 'router/route_generator.dart';
import 'router/routing_variables.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'EmailBypasser',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Navigation.authPage,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPage(),
    );
  }
}
