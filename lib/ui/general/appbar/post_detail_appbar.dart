import 'package:flutter/material.dart';

class PostDetailAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const PostDetailAppbar({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Size get preferredSize {
    return Size.fromHeight(36);
  }

  @override
  Widget build(BuildContext context) {
    var titleStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
    );

    return AppBar(
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        title,
        style: titleStyle,
      ),
      titleSpacing: -1.2,
      elevation: 0.0,
      actions: [
        GestureDetector(
          onTap: () => print('add new post'),
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.favorite,
              size: 32,
              color: Colors.red,
            ),
          ),
        )
      ],
    );
  }
}
