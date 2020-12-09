import 'package:flutter/material.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  GeneralAppBar(this.title);

  @override
  Size get preferredSize {
    return Size.fromHeight(50);
  }

  @override
  Widget build(BuildContext context) {

    return AppBar(
      title: Text(title),
      centerTitle: true,
      titleSpacing: -1.2,
      elevation: 0.0,
    );

  }
}