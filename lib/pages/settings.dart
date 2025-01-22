// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/util/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Settings",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Container(
        color: Colors.lightGreen[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                title: Text("Jack Wayne!",
                    style: Theme.of(context).textTheme.bodyMedium),
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
              SizedBox(height: 10),
              Consumer<UiProvider>(
                builder: (context, UiProvider notifier, child) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.dark_mode),
                      title: Text(
                        'Dark Mode',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      trailing: Switch(
                          value: notifier.isDark,
                          onChanged: (value) => notifier.changeTheme()),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

              //SettingsTile(
                  //iconPath: "icons/themes.png",
                  //IconButton: IconButton(
                    //onPressed: () {},
                    //icon: Icon(
                      //Icons.toggle_off_outlined,
                      //size: 40,
                    //),
                  //),
                //  title: 'Appearance'),
              //SizedBox(height: 10),
            //],