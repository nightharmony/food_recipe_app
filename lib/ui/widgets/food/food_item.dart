import 'package:flutter/material.dart';
import 'package:food_recipe/providers/categories.dart';
import 'package:food_recipe/providers/food_recipes.dart';
import 'package:provider/provider.dart';

import '../../../models/category_model.dart';
import '../../../models/food_recipe_model.dart';

class FoodItem extends StatefulWidget {
  FoodRecipe foodRecipe;

  FoodItem({
    Key key,
    @required this.foodRecipe,
  }) : super(key: key);

  @override
  _FoodItemState createState() => _FoodItemState();
}

class _FoodItemState extends State<FoodItem> {
  var category = Category();

  @override
  void initState() { 
    super.initState();
    _findCategory(widget.foodRecipe.categoryId);
  }
  
  Future<void> _findCategory(String id) async {
    var foodRecipesProvider = Provider.of<FoodRecipes>(context, listen: false);

    Category buildCategory =
        await foodRecipesProvider.findCategory(widget.foodRecipe.categoryId);

    setState(() {
      category = buildCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle categoryNameAndDuration = TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.w300,
    );
    
    

    return Container(
      height: 120,
      color: Colors.red,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              "assets/images/today.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.foodRecipe.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Divider(
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 2.5,
                      ),
                      child: Text(
                        category.title == null ? "undefined" : category.title,
                        style: categoryNameAndDuration,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 0.5,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 2.5,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.timer,
                            color: Colors.white,
                            size: 17,
                          ),
                          Text(
                            "${widget.foodRecipe.duration} min",
                            style: categoryNameAndDuration,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            color: Colors.black54,
            width: double.infinity,
          ),
        ],
      ),
    );
  }
}
