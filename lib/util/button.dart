// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String iconImage;

  VoidCallback onPressed;

  Button({
    super.key,
    required this.iconImage,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: ImageIcon(AssetImage(iconImage)),
      iconSize: 40,
      onPressed: onPressed,
    );
  }
}
