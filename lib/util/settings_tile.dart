import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final Widget IconButton;
  const SettingsTile({
    super.key,
    required this.iconPath,
    required this.title,
    required this.IconButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: ImageIcon(
          AssetImage(iconPath),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: IconButton,
      ),
    );
  }
}
