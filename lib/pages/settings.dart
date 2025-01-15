// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            "Settings",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "ACCOUNT",
            style: TextStyle(
              fontSize: 10,
              fontStyle: FontStyle.normal,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 15),
          ListTile(
            leading: CircleAvatar(
              radius: 25,
              child: Image.asset('icons/office-man.png'),
            ),
            title: Text(
              "Jack Wayne!",
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "  Welcome back to your To-Do!",
              style: TextStyle(
                fontSize: 10,
                fontStyle: FontStyle.italic,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_right),
            ),
          ),
          SizedBox(height: 10),
          Divider(
            thickness: 0.3,
            indent: 5,
            endIndent: 5,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
