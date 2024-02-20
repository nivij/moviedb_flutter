import 'package:flutter/material.dart';
import '../../res/buttons/appbar.dart';
import '../../res/string/string.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final double leadingWidth ;
  final Widget? leading; // Add this line

  const CustomAppBar({required this.title, this.actions, this.leading, required this.leadingWidth}); // Update constructor

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ?? null,
      leadingWidth: leadingWidth,// Use the provided leading if available, otherwise null
      backgroundColor: Color(0xFF121318),
      title: Text(title, style: AppBarString.titleStyle),
      actions: actions ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
