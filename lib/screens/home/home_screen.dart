import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../ui/screens/home/inc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TodaysFoodRecipe(),
        CategoriesInHomePage(),
        TopTenFoods(),
      ],
    );
  }
}
