import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../services/services.dart';
import '../models/category_model.dart';

class Categories extends ChangeNotifier {
  var _items = [];

  List<Category> get categories {
    return [..._items];
  }

  Future<void> getCategories() async {
    var url = Services.GET_CATEGORIES;
    var response = await http.get(url);
    var categories = json.decode(response.body) as List<dynamic>;
    categories.forEach((category) {
      _items.add(
        Category(
          id: category['category_id'],
          title: category['category_name'],
          imageUrl: category['category_image_url'],
          categoryAddedByThisUserId: category['category_added_by_user_id'],
          addedAt: category['category_added_at'],
        ),
      );
    });
  }
}
