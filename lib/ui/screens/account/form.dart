import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_recipe/providers/user_provider.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../services/services.dart';

class AccountSign extends StatefulWidget {
  @override
  _AccountSignState createState() => _AccountSignState();
}

class _AccountSignState extends State<AccountSign> {
  var _formKey = GlobalKey<FormState>();

  var _authDetail = "";
  var _password = "";

  Future<void> _login() async {
    _formKey.currentState.save();
    var user = Provider.of<UserProvider>(context, listen: false);
    try {
      bool respond = await user.userLogin(_authDetail, _password);
      if (respond == true) {
        print("giriş başarılı");
      } else {
        print("giriş başarısız");
      }
    } catch (e) {
      print(e);
    }
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
              )
            ],
          )),
      height: size.height,
      width: size.width,
    );
  }
}
