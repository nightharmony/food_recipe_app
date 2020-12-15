import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/services.dart';

import '../models/food_recipe_model.dart';

class FoodRecipes extends ChangeNotifier {
  List<FoodRecipe> _items = [];

  List<FoodRecipe> get foodRecipes {
    return [..._items];
  }

  Future<void> getFoodRecipes() async {
    var url = Services.GET_FOOD_RECIPES;
    var response = await http.get(url);
    var recipes = json.decode(response.body) as List<dynamic>;
    if(_items.length > recipes.length || _items.length < recipes.length){
      recipes.forEach((recipe) {
      _items.add(
        FoodRecipe(
          id: recipe["recipe_id"],
          categoryId: recipe["recipe_category_id"],
          authorId: recipe["recipe_author_id"],
          title: recipe["recipe_title"],
          imagePath: recipe["recipe_image_url"],
          steps: [],
          ingredients: [],
          duration: 3,
          addedAt: recipe["recipe_added_at"],
        ),
      );    
      print("recipe category id = " + recipe["recipe_category_id"]);
    });
    }
  }
}
