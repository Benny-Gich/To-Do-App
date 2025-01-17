// ignore_for_file: body_might_complete_normally_nullable
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/pages/add_task.dart';
import 'package:to_do/util/app_drawer.dart';
import 'package:to_do/util/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _mybox = Hive.box('MyBox');
  TodoDatabase db = TodoDatabase();

  @override
//First Time running the app
  void initState() {
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //Text Editing controller
  final _controller = TextEditingController();

  //save new task
  Void? saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //CheckBox Tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDatabase();
  }

  //Add Task Method
  void addNote() {
    showDialog(
        context: context,
        builder: (context) {
          return AddTask(
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop(),
              controller: _controller);
        });
    db.updateDatabase();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "TO-DO",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.toggle_off_outlined),
            iconSize: 30,
          ),
        ],
      ),
      drawer: SafeArea(
        child: Drawer(
          backgroundColor: Colors.lightGreen[100],
          child: Column(
            children: [
              DrawerHeader(
                child: CircleAvatar(
                  radius: 30,
                  child: Image.asset('icons/to-do-list.png'),
                ),
              ),
              AppDrawer(
                Icon: Icon(Icons.home),
                drawertitle: "Home",
                Route: '/Homepage',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '$Route');
                },
              ),
              AppDrawer(
                Icon: Icon(Icons.home),
                drawertitle: "Settings",
                Route: '/Settings',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '$Route');
                },
              ),
              AppDrawer(
                Icon: Icon(Icons.more),
                drawertitle: "More",
                Route: '/More',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '$Route');
                },
              ),
              AppDrawer(
                Icon: Icon(Icons.recycling),
                drawertitle: "Trash",
                Route: '/Trash',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '$Route');
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) => TodoTile(
          taskName: db.toDoList[index][0],
          taskCompleted: db.toDoList[index][1],
          onChanged: (value) => checkBoxChanged(true, index),
          deleteFunction: (context) => deleteTask(index),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNote,
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
