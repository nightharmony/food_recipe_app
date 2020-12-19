import 'package:flutter/material.dart';

class AccountAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String userName;

  const AccountAppBar({
    Key key,
    this.userName,
  }) : super(key: key);

  @override
  Size get preferredSize {
    return Size.fromHeight(36);
  }
  @override
  _AccountAppBarState createState() => _AccountAppBarState();
}

class _AccountAppBarState extends State<AccountAppBar> {

  _goToAddNewPostScreen(){
    Navigator.of(context).pushNamed('add-new-post');
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
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        '@' + widget.userName,
        style: titleStyle,
      ),
      titleSpacing: -1.2,
      elevation: 0.0,
      actions: [
        GestureDetector(
          onTap: _goToAddNewPostScreen,
          child: Container(
            margin: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.add_box_outlined,
              size: 32,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
