import 'package:flutter/material.dart';

import 'screens.dart';

import '../ui/general/theme_data.dart';
import '../ui/general/appbar/appbar.dart';

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
    _pages = [homeScreen, homeScreen, homeScreen];
    // Appbars
    homeAppBar = GeneralAppBar("FoodRecipes");
    _appbars = [homeAppBar, homeAppBar, homeAppBar];
  }

  @override
  Widget build(BuildContext context) {
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
              icon: Icon(Icons.restaurant),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          onTap: _onItemTapped,
        );
  }
}
