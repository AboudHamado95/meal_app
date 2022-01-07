import 'package:flutter/material.dart';
import 'package:mealapp/constants/constants.dart';
import 'package:mealapp/screens/categories_screen.dart';
import 'package:mealapp/screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
        home: (context) => const CategoriesScreen(),
        categoryMeals: (context) => const CategoryMealsScreen()
      },
    );
  }
}
