import '../models/food_recipe_model.dart';

List<FoodRecipe> foodRecipes = [
  FoodRecipe(
    id: "1",
    categoryId: "1",
    title: "Fish",
    steps: ["1. Step", "2. Step", "3. Step", "4. Step"],
    imagePath: "assets/images/fish.png",
    addedAt: DateTime.now().toString(),
    authorId: "123",
  ),
  FoodRecipe(
    id: "2",
    categoryId: "2",
    title: "Meat",
    steps: ["1. Step", "2. Step", "3. Step", "4. Step"],
    imagePath: "assets/images/fish.png",
    addedAt: DateTime.now().toString(),
    authorId: "123",
  ),
];
