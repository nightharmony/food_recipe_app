import 'package:flutter/material.dart';

class CategoryWidgetForHomePage extends StatelessWidget {
  final Image image;
  final String categoryName;

  const CategoryWidgetForHomePage({
    Key key,
    @required this.image,
    @required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: image,
            height: 90,
            width: 90,
          ),
          Container(
            color: Colors.black54,
            child: Center(
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white, letterSpacing: -0.3, fontSize: 18),
              ),
            ),
            height: 90,
            width: 90,
          ),
        ],
      ),
      height: 90,
      width: 90,
      margin: EdgeInsets.fromLTRB(5, 5, 0, 5),
    );
  }
}
