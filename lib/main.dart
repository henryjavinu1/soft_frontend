import 'package:flutter/material.dart';
import 'package:soft_frontend/screens/login/login.screen.dart';
import 'package:soft_frontend/screens/talonarios/talonarios.screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soft',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}
