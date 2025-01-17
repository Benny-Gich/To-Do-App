// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final Widget Icon;
  final String drawertitle;
  final String Route;

  const AppDrawer({
    super.key,
    required this.Icon,
    required this.drawertitle,
    required this.Route,
    required Null Function() onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon,
      iconColor: Theme.of(context).colorScheme.primary,
      title: Text(
        drawertitle,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, (Route));
      },
    );
  }
}
