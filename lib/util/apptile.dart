import 'package:flutter/material.dart';
import 'package:to_do/data/database.dart';

class Apptile extends StatelessWidget {
  final String imageiconpath;
  final String title;
  final String subTitle;
  final Widget icon;

  const Apptile({
    super.key,
    required this.imageiconpath,
    required this.title,
    required this.subTitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.lightGreen[200],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 45,
                    child: Image.asset(imageiconpath),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 25,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        subTitle,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '${TodoDatabase().toDoList.length}',
                        style: TextStyle(
                            fontSize: 15, fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                  icon,
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
