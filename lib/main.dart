import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do/pages/apptile.dart';
import 'package:to_do/pages/homepage.dart';
import 'package:to_do/pages/more.dart';
import 'package:to_do/pages/settings.dart';

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
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
