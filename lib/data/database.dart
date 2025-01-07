import 'package:hive/hive.dart';

class TodoDatabase {
//List of To-Do Tasks
  List toDoList = [];

  //Reference the Box
  final _mybox = Hive.box('MyBox');

  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["Eat Greakfast", false],
    ];
  }

  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  void updateDatabase() {
    _mybox.put("TODOLIST", toDoList);
  }
}
