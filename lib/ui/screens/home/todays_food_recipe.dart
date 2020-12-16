import 'package:flutter/material.dart';

class TodaysFoodRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 110,
      width: size.width * 0.99,
      child: Stack(
        overflow: Overflow.visible,
        alignment: Alignment.center,
        children: [
          _buildBackgroundImage(
            image: Image.asset("assets/images/today.jpg", fit: BoxFit.cover,),
            size: size,
          ),
          _buildFilterandText(size: size, todaysFood: "Fish2"),
          _buildButton(size),
        ],
      ),
    );
  }

  // Background Image
  Widget _buildBackgroundImage({Size size, Image image}) {
    return Positioned(
      top: 0,
      child: Container(
        height: 80,
        width: size.width,
        child: image,
      ),
    );
  }

  // Photo Filter and Text
  Positioned _buildFilterandText({Size size, String todaysFood}) {
    return Positioned(
      top: 0,
      child: Container(
        height: 80,
        width: size.width,
        color: Colors.black45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Today's Food Recipe",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              todaysFood,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }

  // Button
  Positioned _buildButton(Size size) {
    return Positioned(
      bottom: 0,
      child: Container(
        height: 30,
        width: size.width,
        child: RaisedButton(
          onPressed: () {},
          child: Text(
            "LOOK TO RECIPE",
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.indigo,
          highlightColor: Colors.red[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
      ),
    );
  }
}
