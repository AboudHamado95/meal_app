import 'package:flutter/material.dart';
import 'package:mealapp/models/meal.dart';
import 'package:mealapp/screens/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;
  FavouritesScreen({Key? key, required this.favouriteMeals}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favourite yet - start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favouriteMeals[index].id,
            title: favouriteMeals[index].title,
            imageUrl: favouriteMeals[index].imageUrl,
            duration: favouriteMeals[index].duration,
            complexity: favouriteMeals[index].complexity,
            affordability: favouriteMeals[index].affordability,
            
          );
        },
        itemCount: favouriteMeals.length,
      );
    }
  }
}
