// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:to_do/util/button.dart';

class AddTask extends StatelessWidget {
  AddTask(
      {super.key,
      required this.onSave,
      required this.onCancel,
      required this.controller});

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColor,
      content: SizedBox(
        height: 200,
        width: 300,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              //Get USer Input
              child: TextField(
                style: TextStyle(color: Colors.grey),
                controller: controller,
                decoration: InputDecoration(
                  fillColor: Colors.white24,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Add Task...",
                  hintMaxLines: 1,
                  focusColor: Colors.grey,
                  hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(
                  onPressed: onSave,
                  iconImage: 'icons/save.png',
                ),
                SizedBox(width: 20),
                Button(
                  onPressed: onCancel,
                  iconImage: 'icons/cancel.png',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
