import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final imageUrl;

  const ProfileImage({
    Key key,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageUrl),
              fit: BoxFit.cover,
            ),
            shape: BoxShape.circle,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
