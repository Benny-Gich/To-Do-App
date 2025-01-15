import 'package:flutter/material.dart';
import 'package:to_do/pages/apptile.dart';

class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerButton(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          "More",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
              color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Apptile(
              imageiconpath: "icons/house.png",
              title: "Home",
              subTitle: "List of all notes",
              icon: Icon(Icons.arrow_forward_ios)),
          Apptile(
            imageiconpath: "icons/star.png",
            title: "Favourite",
            subTitle: " Liked Noted",
            icon: Icon(Icons.arrow_forward_ios),
          ),
          Apptile(
            imageiconpath: "icons/recycle-bin.png",
            title: "Trash",
            subTitle: "Deleted Items",
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
