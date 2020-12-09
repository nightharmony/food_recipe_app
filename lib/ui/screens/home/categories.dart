import 'package:flutter/material.dart';

import '../../widgets/category/category_in_home_page.dart';

class CategoriesInHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Column(
        children: [
          _buildTitle(),
          _buildListView(),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  } 

  // Title
  Container _buildTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      child: Text(
        "Categories",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
      ),
    );
  }

  // List
  Container _buildListView() {
    return Container(
      child: ListView(
        children: [
          CategoryWidgetForHomePage(
            image: Image.asset(
              "assets/images/today.jpg",
              fit: BoxFit.cover,
            ),
            categoryName: "Meat",
          ),
        ],
        scrollDirection: Axis.horizontal,
      ),
      height: 90,
      color: Colors.white,
    );
  }
}
