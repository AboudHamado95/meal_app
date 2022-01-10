import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:mealapp/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  late Function toggleFavourites;
  late Function isFavourites;
  MealDetailScreen(
      {Key? key, required this.toggleFavourites, required this.isFavourites})
      : super(key: key);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: Text(text, style: Theme.of(context).textTheme.headline1));
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey),
      ),
      margin: const EdgeInsets.all(12.0),
      padding: const EdgeInsets.all(12.0),
      height: 200.0,
      width: 300.0,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mailId = ModalRoute.of(context)!.settings.arguments as String;
    final selectMeal = DummyMeals.firstWhere((meal) => meal.id == mailId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300.0,
              width: double.infinity,
              child: Image(
                  image: CachedNetworkImageProvider(selectMeal.imageUrl),
                  fit: BoxFit.cover),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 8.0),
                      child: Text(selectMeal.ingredients[index]),
                    ),
                  );
                },
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectMeal.steps[index]),
                      ),
                      const Divider()
                    ],
                  );
                },
                itemCount: selectMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          toggleFavourites(mailId);
        },
        child: Icon(isFavourites(mailId) ? Icons.star : Icons.star_border),
      ),
    );
  }
}
