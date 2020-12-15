import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
// Widgets
import '../../ui/screens/home/inc.dart';
// Providers
import '../../providers/food_recipes.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
