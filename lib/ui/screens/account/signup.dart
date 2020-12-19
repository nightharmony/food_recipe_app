import 'package:flutter/material.dart';
import 'package:food_recipe/providers/user_provider.dart';
import 'package:nanoid/nanoid.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var _formKey = GlobalKey<FormState>();

  var _authDetail;
  var _password;

  Future<void> _register() async {
    _formKey.currentState.save();
    var user = Provider.of<UserProvider>(context, listen: false);
    try {
      String respond = await user.userRegister(_authDetail, _password);
      if (respond == 'ok') {
        print("kayıt başarılı");
        var token = nanoid(256);
        var prefs = await _prefs;
        var isRegistered =
            await user.sessionRegister(token, user.currentUser.userId);
        if (isRegistered) {
          prefs.setString('authToken', token);

          Navigator.of(context).pop();
        } else {
          print("an error occured");
        }
      } else if (respond == 'UsernameAlreadyTaken') {
        print("kullanıcı adı zaten alınmış");
      } else {
        print("bir sorun oluştu");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        margin: EdgeInsets.only(top: 300),
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
                OutlinedButton(
                  onPressed: _register,
                  child: Text("SIGN UP"),
                ),
              ],
            )),
        height: size.height,
        width: size.width,
      ),
    );
  }
}
