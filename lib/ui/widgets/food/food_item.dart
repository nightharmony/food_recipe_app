import 'package:flutter/material.dart';
import 'package:food_recipe/models/food_recipe_model.dart';

class FoodItem extends StatelessWidget {
  FoodRecipe foodRecipe;

  FoodItem({
    Key key,
    @required this.foodRecipe,
  }) : super(key: key);

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
                  foodRecipe.title,
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
                        foodRecipe.categoryId,
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
                            "${foodRecipe.duration} min",
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
