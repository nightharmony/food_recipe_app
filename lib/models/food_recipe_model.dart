class FoodRecipe {
  final String id;
  final String categoryId;
  final String title;
  final List<String> steps;
  final String imagePath;
  final DateTime addedAt;

  FoodRecipe({
    this.id,
    this.categoryId,
    this.title,
    this.steps,
    this.imagePath,
    this.addedAt,
  });
}
