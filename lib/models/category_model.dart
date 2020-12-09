import 'package:flutter/cupertino.dart';

class Category {
  final String categoryId;
  final String title;
  final IconData icon;
  final DateTime addedAt;

  Category({
    this.categoryId,
    this.title,
    this.icon,
    this.addedAt,
  });
}
