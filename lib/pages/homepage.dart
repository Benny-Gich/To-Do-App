// ignore_for_file: body_might_complete_normally_nullable

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:to_do/data/database.dart';
import 'package:to_do/pages/add_task.dart';
import 'package:to_do/pages/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _mybox = Hive.openBox('MyBox');
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
      TodoDatabase db = TodoDatabase();
    });
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
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              onPressed: () {
                Drawer;
                //Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              icon: Icon(
                Icons.menu,
                size: 25,
                color: Colors.white,
              ),
            );
          },
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "TO-DO",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
              size: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) => TodoTile(
          taskName: db.toDoList[index][0],
          taskCompleted: db.toDoList[index][1],
          onChanged: (value) => checkBoxChanged(true, index),
          deleteFunction: (context) => deleteTask,
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
