import 'package:flutter/material.dart';

class EditProfileButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: size.width * 0.90,
      child: OutlineButton(
        highlightedBorderColor: Colors.grey[300],
        onPressed: () {},
        borderSide: BorderSide(
          color: Colors.grey[300],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
    );
  }
}
