import 'package:flutter/material.dart';
import 'package:food_recipe/models/category_model.dart';
import 'package:food_recipe/providers/categories.dart';
import 'package:provider/provider.dart';

import '../../widgets/category/category_in_home_page.dart';

class CategoriesInHomePage extends StatefulWidget {
  @override
  _CategoriesInHomePageState createState() => _CategoriesInHomePageState();
}

class _CategoriesInHomePageState extends State<CategoriesInHomePage> {
  var _categories = [];

  @override
  void initState() { 
    super.initState();
    _getCategories();
  }

  Future<void> _getCategories() async {
    var categories = Provider.of<Categories>(context, listen: false);
    await categories.getCategories();
    setState(() {
      _categories = categories.categories;
      print(categories.categories.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Column(
        children: [
          _buildTitle(),
          _buildListView(),
        ],
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
    );
  } 

  Container _buildTitle() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 10),
      child: Text(
        "Categories",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: -0.5,
        ),
      ),
    );
  }

  Container _buildListView() {
    return Container(
      child: ListView(
        children: _categories.map((category){
          return CategoryWidgetForHomePage(category: category);
        }).toList(),
        scrollDirection: Axis.horizontal,
      ),
      height: 90,
      color: Colors.white,
    );
  }
}
