
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resto/feature/resto/presentation/pages/favorite/favorite_restaurant_page.dart';
import 'package:resto/feature/resto/presentation/pages/setting/setting_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../restaurant/restaurant_page.dart';
import '../search/search_restaurant_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _getSelectedPage(_selectedIndex),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text("Favorite"),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.settings),
            title: Text("Setting"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }

  Widget _getSelectedPage(int index){
    switch(index){
      case 0:
        return RestaurantPage();
      case 1:
        return FavoriteRestaurantPage();
      case 2:
        return SearchRestaurantPage();
      case 3:
        return SettingPage();
      default:
        return RestaurantPage();
    }
  }
}