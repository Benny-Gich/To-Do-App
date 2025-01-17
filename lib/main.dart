import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/pages/homepage.dart';
import 'package:to_do/pages/more.dart';
import 'package:to_do/pages/settings.dart';
import 'package:to_do/pages/trash.dart';
import 'package:to_do/util/theme.dart';

void main() async {
  //Initialize Hive
  await Hive.initFlutter();

  var box = await Hive.openBox('MyBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/Homepage': (context) => Homepage(),
        '/Settings': (context) => Settings(),
        '/More': (context) => MorePage(),
        '/Trash': (context) => Trash(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        primaryColor: Colors.lightGreen[200],
        textTheme: TextTheme(
          titleMedium: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 25,
            color: Colors.white,
          ),
          bodyMedium: TextStyle(
            fontStyle: FontStyle.normal,
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          bodySmall: TextStyle(
              fontStyle: FontStyle.normal, fontSize: 20, color: Colors.black),
        ),
      ),
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
