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
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Something went wrong.");
    }
  }

  Future<String> userRegister(String authDetail, String password) async {
    var data = {
      'authDetail': authDetail,
      'password': password,
    };

    try {
      var url = Services.USER_REGISTER;
      var response = await http.post(
        url,
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
      );
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

        return 'ok';
      } else if (message['respond'] == '0') {
        return 'UsernameAlreadyTaken';
      } else {
        return 'something went wrong';
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> sessionRegister(String token, String userId) async {
    var data = {
      "authToken": token,
      "authUserID": userId,
    };

    try {
      var url = Services.SESSION_REGISTER;
      var response = await http.post(
        url,
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
      );
      var message = jsonDecode(response.body);
      print(message);
      if (message["respond"] == "1") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> checkSession(String authToken) async {
    var data = {
      "authToken": authToken,
    };
    try {
      var url = Services.CHECK_SESSION;
      var response = await http.post(
        url,
        body: jsonEncode(data),
        headers: {
          'Content-Type': 'application/json;charset=UTF-8',
          'Charset': 'utf-8'
        },
      );
      var message = jsonDecode(response.body) as List<dynamic>;
      print(message);
      if(message.length != 0){
        var userId = message[0]['user_id'];
        var userName = message[0]['user_name'];
        var userMail = message[0]['user_mail'];
        var userRegisteredAt = message[0]['user_registered_at'];

          _user = User(
          userId: userId,
          userName: userName,
          userMail: userMail,
          userRegisteredAt: userRegisteredAt,
        );
        notifyListeners();
        return true;
      }
    } catch (e) {
      print(e);
    }
  }
}
