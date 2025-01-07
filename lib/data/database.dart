import 'package:hive/hive.dart';

class TodoDatabase {
//List of To-Do Tasks
  List toDoList = [];

  //Reference the Box
  final _mybox = Hive.openBox('MyBox');
}
