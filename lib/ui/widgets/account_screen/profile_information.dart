import 'package:flutter/material.dart';

class ProfileInformation extends StatelessWidget {
  final numberOfPosts;
  final numberOfFollowers;
  final numberOfFollows;

  const ProfileInformation({
    Key key,
    @required this.numberOfPosts,
    @required this.numberOfFollowers,
    @required this.numberOfFollows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final numberStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    var textStyle = TextStyle(
      fontSize: 16,
    );

    return Container(
      width: size.width * 0.90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                numberOfPosts,
                style: numberStyle,
              ),
              Text(
                'Posts',
                style: textStyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                numberOfFollowers,
                style: numberStyle,
              ),
              Text(
                'Followers',
                style: textStyle,
              ),
            ],
          ),
          Column(
            children: [
              Text(
                numberOfFollows,
                style: numberStyle,
              ),
              Text(
                'Following',
                style: textStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
