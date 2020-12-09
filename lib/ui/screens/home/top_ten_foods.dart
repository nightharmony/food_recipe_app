import 'package:flutter/material.dart';

import '../../widgets/food/food_item.dart';

class TopTenFoods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildTitle(),
          FoodItem(
            image: Image.asset(
              "assets/images/today.jpg",
              fit: BoxFit.cover,
            ),
            title: "Food Name",
            categoryName: "try again 45",
            duration: "45 Min",
          ),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  }

  Container _buildTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      child: Text(
        "Top Food Recipes",
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: -0.5),
      ),
    );
  }
}
