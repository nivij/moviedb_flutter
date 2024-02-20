import 'package:flutter/material.dart';
import '../../res/buttons/appbar.dart';
import '../../res/string/string.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;

  const CustomAppBar({required this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 12,
      backgroundColor: Color(0xFF121318),
      title: Text(title, style: AppBarString.titleStyle),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
