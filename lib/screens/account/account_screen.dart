import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/user_provider.dart';

import '../../ui/screens/account/inc.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  var _authToken;
  var _isLoading = false;
  var _hasAuthKey = false;
  var _userName = "";

  @override
  void initState() {
    super.initState();
    _checkToken();
  }

  Future<void> _checkToken() async {
    setState(() {
      _isLoading = true;
    });
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    var prefs = await _prefs;
    var authToken = prefs.getString('authToken');

    _authToken = authToken;

    var session = await userProvider.checkSession(_authToken);
    if (session == true) {
      setState(() {
        _userName = userProvider.currentUser.userName;
        _isLoading = false;
        _hasAuthKey = true;
      });
    } else {
      setState(() {
        _isLoading = false;
        _hasAuthKey = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading == true
        ? Center(
            child: CircularProgressIndicator(),
          )
        : _hasAuthKey == true
            ? AccountPage(userName: _userName,)
            : AccountLogin();
  }
}
