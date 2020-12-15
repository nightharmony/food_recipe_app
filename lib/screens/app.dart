import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens.dart';

import '../ui/general/theme_data.dart';
import '../ui/general/appbar/appbar.dart';

import '../providers/food_recipes.dart';

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
  // Appbars
  GeneralAppBar homeAppBar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Pages
    homeScreen = HomeScreen();
    _pages = [homeScreen, homeScreen, homeScreen, homeScreen, homeScreen];
    // Appbars
    homeAppBar = GeneralAppBar("FoodRecipes");
    _appbars = [homeAppBar, homeAppBar, homeAppBar, homeAppBar, homeAppBar];
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: FoodRecipes(),
        ),
      ],
      builder: (ctx, w) {
        return MaterialApp(
          title: "Food Recipes",
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          home: Scaffold(
            appBar: _appbars[_selectedIndex],
            body: _pages[_selectedIndex],
            bottomNavigationBar: _buildBottomNavigationBar,
          ),
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
          icon: Icon(Icons.add_box_outlined),
          label: 'Post',
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
