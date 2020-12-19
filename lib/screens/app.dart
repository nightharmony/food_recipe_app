import 'package:flutter/material.dart';
import 'package:food_recipe/ui/widgets/account_screen/add_new_post.dart';
import 'package:provider/provider.dart';

import 'screens.dart';

import '../ui/screens/account/signup.dart';
import '../ui/widgets/account_screen/post_details.dart';
import '../ui/general/theme_data.dart';
import '../ui/general/appbar/inc.dart';

import '../providers/providers.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var _pages = [];
  var _appbars = [];
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Screens
  HomeScreen homeScreen;
  SocialScreen socialScreen;
  AccountScreen accountScreen;
  // Appbars
  GeneralAppBar homeAppBar;
  AccountAppBar accountAppBar;

  @override
  void initState() {
    super.initState();
    // Pages
    homeScreen = HomeScreen();
    socialScreen = SocialScreen();
    accountScreen = AccountScreen();
    _pages = [homeScreen, homeScreen, socialScreen, accountScreen];
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: FoodRecipes(),
        ),
        ChangeNotifierProvider.value(
          value: Categories(),
        ),
        ChangeNotifierProvider.value(
          value: UserProvider(),
        ),
      ],
      builder: (ctx, w) {
        return MaterialApp(
          title: "Food Recipes",
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home: Scaffold(
            body: _pages[_selectedIndex],
            bottomNavigationBar: _buildBottomNavigationBar,
          ),
          routes: {
            "signup": (ctx) => SignUp(),
            "post-details": (ctx) => PostDetails(),
            "add-new-post": (ctx) => AddNewPost(),
          },
        );
      },
    );
  }

  Widget get _buildBottomNavigationBar {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forum),
          label: 'Social',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'Account',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.red,
      onTap: _onItemTapped,
    );
  }
}
