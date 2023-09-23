import 'package:flutter/material.dart';
import 'package:moma_web/src/pages/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dashboard',
      theme: ThemeData(
          colorScheme: const ColorScheme.light(
            primary: Color.fromRGBO(0, 176, 246, 1),
            onPrimary: Colors.white,
            secondary: Color.fromRGBO(114, 226, 252, 1),
            onSecondary: Colors.white,
            onBackground: Colors.black,
            outline: Color.fromRGBO(221, 221, 221, 1),
          ),
          fontFamily: 'MONTSERRAT'),
      home: DashboardPage(),
    );
  }
}
