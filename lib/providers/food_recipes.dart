import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/services.dart';

import '../models/models.dart';

class FoodRecipes extends ChangeNotifier {
  List<FoodRecipe> _items = [];
  // Return Food Recipes
  List<FoodRecipe> get foodRecipes {
    return [..._items];
  }

  // Fetch Food Recipes
  Future<void> getFoodRecipes() async {
    var url = Services.GET_FOOD_RECIPES;
    var response = await http.get(url);
    var recipes = json.decode(response.body) as List<dynamic>;
    if (_items.length > recipes.length || _items.length < recipes.length) {
      for(var recipe in recipes) {
        List<dynamic> ingredientList = await _returnIngredientList(recipe["recipe_id"]);

        _items.add(
          FoodRecipe(
            id: recipe["recipe_id"],
            categoryId: recipe["recipe_category_id"],
            authorId: recipe["recipe_author_id"],
            title: recipe["recipe_title"],
            imagePath: recipe["recipe_image_url"],
            ingredients: ingredientList,
            steps: [],
            duration: 3,
            addedAt: recipe["recipe_added_at"],
          ),
        );
      }
    }
  }

  // Returning Ingredients List
  Future<List<dynamic>> _returnIngredientList(String id) async {
    var ingredientList = [];
    var url = Services.GET_INGREDIENTS + id;
    var response = await http.get(url);
    var ingredients = json.decode(response.body) as List<dynamic>;
    for(var ingredient in ingredients){
      ingredientList.add(ingredient['ingredient_text']);
    }
    return ingredientList;
  }

  // Find Category
  Future<Category> findCategory(String id) async {
    var category;

    var url = Services.FIND_CATEGORY + id;
    var response = await http.get(url);
    var foundCategory = json.decode(response.body) as List<dynamic>;

    if (foundCategory.length > 0) {
      var categoryId = foundCategory[0]['category_id'];
      var categoryName = foundCategory[0]['category_name'];
      var categoryImageURL = foundCategory[0]['category_image_url'];
      var categoryAddedByThisUserID =
          foundCategory[0]['category_added_by_user_id'];
      var categoryAddedAt = foundCategory[0]['category_added_at'];

      category = Category(
        id: categoryId,
        title: categoryName,
        imageUrl: categoryImageURL,
        categoryAddedByThisUserId: categoryAddedByThisUserID,
        addedAt: categoryAddedAt,
      );
    }

    category = null;

    print(response.body);

    return category;
  }
}
