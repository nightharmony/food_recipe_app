import 'package:flutter/material.dart';
import 'package:food_recipe/models/category_model.dart';
import 'package:food_recipe/providers/categories.dart';
import 'package:provider/provider.dart';

import '../../models/food_recipe_model.dart';
import '../../providers/food_recipes.dart';

class SocialScreen extends StatefulWidget {
  @override
  _SocialScreenState createState() => _SocialScreenState();
}

class _SocialScreenState extends State<SocialScreen> {
  List<FoodRecipe> _foodRecipes = [];

  @override
  void initState() {
    super.initState();
    _getFoodRecipes();
  }

  Future<void> _getFoodRecipes() async {
    
    var recipes = Provider.of<FoodRecipes>(context, listen: false);
    // Test Start
    recipes.findCategory("1");
    // Test End
    await recipes.getFoodRecipes();
    setState(() {
      _foodRecipes = recipes.foodRecipes;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: _foodRecipes.length == null || _foodRecipes.length == 0
          ? Container(
              height: 250,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            )
          : ListView(
              children: _foodRecipes.map((recipe) {

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(recipe.title),
                    Text(recipe.categoryId),
                    Text(recipe.addedAt),
                  ],
                );
              }).toList(),
            ),
      height: size.height,
      width: size.width,
    );
  }
}
