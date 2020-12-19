import 'package:flutter/material.dart';
import 'package:food_recipe/ui/general/appbar/account_appbar.dart';

import '../../../widgets/account_screen/inc.dart';

class AccountPage extends StatefulWidget {
  final userName;

  const AccountPage({
    Key key,
    this.userName,
  }) : super(key: key);
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AccountAppBar(userName: widget.userName,),
      body: ListView(
        children: [
          Container(
            height: size.height,
            color: Colors.white,
            child: ListView(
              children: [
                ProfileImage(
                  imageUrl: 'assets/images/today.jpg',
                ),
                ProfileInformation(
                    numberOfPosts: '0',
                    numberOfFollowers: '144',
                    numberOfFollows: '155'),
                EditProfileButton(),
                Posts(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
