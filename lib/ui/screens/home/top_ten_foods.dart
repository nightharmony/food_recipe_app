import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
// Widgets
import '../../widgets/food/food_item.dart';
// Models
import '../../../models/food_recipe_model.dart';
// Providers
import '../../../providers/food_recipes.dart';

class TopTenFoods extends StatefulWidget {
  @override
  _TopTenFoodsState createState() => _TopTenFoodsState();
}

class _TopTenFoodsState extends State<TopTenFoods> {
  // -- ! Food Recipe List Here ! --
  var foodRecipeList = [];
/// sdsa
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getFoodRecipes();
  }

  Future<void> _getFoodRecipes() async {
    var foodRecipes = Provider.of<FoodRecipes>(context, listen: false);
    await foodRecipes.getFoodRecipes();
    setState(() {
      foodRecipeList = foodRecipes.foodRecipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _buildTitle(),
          Column(
            children: foodRecipeList.map((food) {
              return FoodItem(
                foodRecipe: food,
              );
            }).toList(),
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
