import 'package:flutter/material.dart';

import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/drawer/mydrawer.dart';
import 'package:mealapp/screens/favourites_screen.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;
  TabScreen({Key? key, required this.favouriteMeals}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, Object>>? pages;
  int selectedPageIndex = 0;

  @override
  void initState() {
    pages = [
      {
        'page': const CategoriesScreen(),
        'title': 'Categories Screen',
      },
      {
        'page': FavouritesScreen(
          favouriteMeals: widget.favouriteMeals,
        ),
        'title': 'Favourites Screen',
      }
    ];
    super.initState();
  }

  void selectPage(int value) {
    setState(() {
      selectedPageIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal'),
      ),
      drawer: const MyDrawer(),
      body: pages![selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: selectPage,
        currentIndex: selectedPageIndex,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
