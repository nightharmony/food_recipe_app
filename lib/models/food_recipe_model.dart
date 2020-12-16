class FoodRecipe {
  final String id;
  final String categoryId;
  final String title;
  final int duration;
  final List<dynamic> ingredients;
  final List<String> steps;
  final String imagePath;
  final String addedAt;
  final String authorId;

  FoodRecipe({
    this.id,
    this.categoryId,
    this.title,
    this.duration,
    this.ingredients,
    this.steps,
    this.imagePath,
    this.addedAt,
    this.authorId,
  });
}
