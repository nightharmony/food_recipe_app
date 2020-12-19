import 'package:flutter/material.dart';

import 'package:food_recipe/models/food_recipe_model.dart';

import 'package:food_recipe/providers/food_recipes.dart';
import 'post_item.dart';
import 'package:provider/provider.dart';
import 'package:food_recipe/providers/providers.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  List<FoodRecipe> _foodRecipes = [];
  @override
  void initState() {
    super.initState();
    getFoodRecipesForUser();
  }

  Future<void> getFoodRecipesForUser() async {
    var user = Provider.of<UserProvider>(context, listen: false);
    var userID = user.currentUser.userId;
    var foodRecipes = Provider.of<FoodRecipes>(context, listen: false);
    await foodRecipes.getFoodRecipesForUser(userID);
    setState(() {
      _foodRecipes = foodRecipes.foodRecipesForUser;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.58,
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        children: _foodRecipes.map((food) {
          return PostItem(foodRecipe: food);
        }).toList(),
      ),
    );
  }
}
