import 'package:flutter/material.dart';
import 'package:food_recipe/models/category_model.dart';

class CategoryWidgetForHomePage extends StatelessWidget {
  final Category category;

  const CategoryWidgetForHomePage({
    Key key,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            child: Image.asset("assets/images/today.jpg"),
            height: 90,
            width: 90,
          ),
          Container(
            color: Colors.black54,
            child: Center(
              child: Text(
                category.title,
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
