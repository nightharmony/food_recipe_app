import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';
import '../services/services.dart';

class UserProvider extends ChangeNotifier {
  User _user;

  User get currentUser {
    return _user;
  }

  Future<bool> userLogin(String authDetail, String password) async {
    var data = {
      'authDetail': authDetail,
      'password': password,
    };

    try {
      var url = Services.USER_LOGIN;
      var response = await http.post(url, body: jsonEncode(data));
      var message = jsonDecode(response.body);
      print(message);
      if (message['respond'] == "1") {
        var userId = message["user"][0]["user_id"];
        var userName = message["user"][0]["user_name"];
        var userMail = message["user"][0]["user_mail"];
        var userRegisteredAt = message["user"][0]["user_registered_at"];

        _user = User(
          userId: userId,
          userName: userName,
          userMail: userMail,
          userRegisteredAt: userRegisteredAt,
        );
        notifyListeners();

        return true;
      }else{
        return false;
      }
    } catch (e) {
      throw Exception("Something went wrong.");
    }
  }
}
