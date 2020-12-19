import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nanoid/nanoid.dart';

import '../../../services/services.dart';

import '../../../providers/user_provider.dart';

class AccountLogin extends StatefulWidget {
  @override
  _AccountLoginState createState() => _AccountLoginState();
}

class _AccountLoginState extends State<AccountLogin> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var _formKey = GlobalKey<FormState>();

  var _authDetail = "";
  var _password = "";

  var mode = "login";

  Future<void> _login() async {
    _formKey.currentState.save();
    var user = Provider.of<UserProvider>(context, listen: false);
    try {
      bool respond = await user.userLogin(_authDetail, _password);
      if (respond == true) {
        var token = nanoid(256);
        var prefs = await _prefs;
        var isRegistered = await user.sessionRegister(token, user.currentUser.userId);
        if(isRegistered){
          prefs.setString('authToken', token);
        }else{
          print("session cant register");
        }
      } else {
        print("giriş başarısız");
      }
    } catch (e) {
      print(e);
    }
  }

  void _signUp() {
    Navigator.of(context).pushNamed("signup");
  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                onSaved: (value) => _authDetail = value,
              ),
              TextFormField(
                onSaved: (value) => _password = value,
              ),
              RaisedButton(
                onPressed: _login,
                child: Text("SIGN IN"),
              ),
              OutlinedButton(
                onPressed: _signUp,
                child: Text("SIGN UP"),
              ),
            ],
          )),
      height: size.height,
      width: size.width,
    );
  }
}
