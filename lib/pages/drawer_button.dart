import 'package:flutter/material.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
          Navigator.pushNamed(context, '/Homepage');
        },
        icon: Icon(Icons.arrow_back_ios));
  }
}
