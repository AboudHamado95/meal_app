import 'package:flutter/material.dart';
import 'package:mealapp/constants/constants.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/category_meals_screen.dart';
import 'package:mealapp/screens/filter_screen.dart';
import 'package:mealapp/screens/layouts/tab_screen.dart';
import 'package:mealapp/screens/meal_detail_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false
  };

  List<Meal> availableMeals = DummyMeals;

  void setFilters(Map _filtersData) {
    setState(() {
      filters = _filtersData;

      availableMeals = DummyMeals.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegeterian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.pink,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.pink)
            .copyWith(secondary: Colors.amber),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: const TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            bodyText2: const TextStyle(
              color: Color.fromRGBO(20, 50, 50, 1),
            ),
            headline1: const TextStyle(
                fontSize: 20.0,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold)),
      ),
      routes: {
        home: (context) => const TabScreen(),
        categoryMeals: (context) => CategoryMealsScreen(
              availableMeals: availableMeals,
            ),
        mealDetails: (context) => const MealDetailScreen(),
        categoryScreen: (context) => const CategoriesScreen(),
        filterScreen: (context) => FilterScreen(
              saveFilters: setFilters,
              currentFilters: filters,
            ),
      },
    );
  }
}
