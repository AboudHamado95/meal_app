import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24.0),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0),
      children: DummyCategories.map((catData) => CategoryItem(
            id: catData.id,
            title: catData.title,
            color: catData.color,
          )).toList(),
    );
  }
}
