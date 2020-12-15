import 'package:flutter/cupertino.dart';

class Category {
  final String id;
  final String title;
  final IconData imageUrl;
  final String categoryAddedByThisUserId;
  final String addedAt;

  Category({
    this.id,
    this.title,
    this.imageUrl,
    this.addedAt,
    this.categoryAddedByThisUserId,
  });
}
