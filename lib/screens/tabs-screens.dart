import 'package:flutter/material.dart';
import '../screens/Home_Screen.dart';
import '../screens/compare_screen.dart';
import '../screens/setting_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';

class TabsScreens extends StatefulWidget {
  static const roouteName = "/";
  static int indexpage = 0;
  @override
  _TabsScreensState createState() => _TabsScreensState();
}

class _TabsScreensState extends State<TabsScreens> {
  List<Map<String, Object>> _pages;
  @override
  void initState() {
    _pages = [
      {'page': HomePage(), 'title': 'Home'},
      {'page': CompareScreen(), 'title': 'Compare'},
      {'page': SettingScreen(), 'title': 'Menu'},
    ];
    super.initState();
  }

  int _selectedpageIndex = TabsScreens.indexpage;

  void _selectPage(int index) {
    setState(() {
    _selectedpageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: _pages[_selectedpageIndex]['page'],
      bottomNavigationBar: CustomNavigationBar(
        iconSize: 26,
        onTap: _selectPage,
        unSelectedColor: Theme.of(context).buttonColor,
        strokeColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        selectedColor: Theme.of(context).accentColor,
        currentIndex: _selectedpageIndex,
        items: [
          CustomNavigationBarItem(icon: Icons.home),
          CustomNavigationBarItem(icon: Icons.compare),
          CustomNavigationBarItem(icon: Icons.settings),
        ],
      ),
    );
  }
}
