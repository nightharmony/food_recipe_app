import 'package:flutter/material.dart';

class User {
  final String userId;
  final String userName;
  final String userMail;
  final String userRegisteredAt;

  User({
    @required this.userId,
    @required this.userName,
    @required this.userMail,
    @required this.userRegisteredAt,
  });
}