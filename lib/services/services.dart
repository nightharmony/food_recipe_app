class Services {
  static const URL = "http://192.168.1.59/";
  static const GET_FOOD_RECIPES = URL + "food_recipe_app/api/food_recipes/get_food_recipes.php";
  static const GET_INGREDIENTS = URL + "food_recipe_app/api/ingredients/get_ingredients.php?ingredient_recipe_id=";
  static const GET_STEPS = URL + "food_recipe_app/api/steps/get_steps.php?step_recipe_id=";
  static const GET_CATEGORIES = URL + "food_recipe_app/api/categories/get_categories.php";
  static const FIND_CATEGORY = URL + "food_recipe_app/api/categories/find_category.php?categoryId=";
  static const USER_LOGIN = URL + "food_recipe_app/api/accounts/login.php";
}