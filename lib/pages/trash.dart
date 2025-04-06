import 'package:flutter/material.dart';

class Trash extends StatelessWidget {
  const Trash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.primary,
        //iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Trash",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.delete,
              size: 30,
            ),
          ),
        ],
      ),
      body: Scaffold(
          //backgroundColor: Colors.lightGreen[100],
          ),
    );
  }
}
