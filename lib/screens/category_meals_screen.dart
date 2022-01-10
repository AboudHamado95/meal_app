import 'package:flutter/material.dart';

import 'package:mealapp/screens/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  late List availableMeals;
  CategoryMealsScreen({Key? key, required this.availableMeals})
      : super(key: key);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String? categoryTitle;
  List? categoryMeals;

  @override
  void didChangeDependencies() {
    final routeArg = ModalRoute.of(context)!.settings.arguments as Map;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void removeItem(String mealId) {
    setState(() {
      categoryMeals!.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: categoryMeals![index].id,
            title: categoryMeals![index].title,
            imageUrl: categoryMeals![index].imageUrl,
            duration: categoryMeals![index].duration,
            complexity: categoryMeals![index].complexity,
            affordability: categoryMeals![index].affordability,
          );
        },
        itemCount: categoryMeals!.length,
      ),
    );
  }
}
