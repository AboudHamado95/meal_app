// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mealapp/constants/constants.dart';

class CategoryItem extends StatelessWidget {
  late String id;
  late String title;
  late Color color;

  CategoryItem(
      {Key? key, required this.id, required this.title, required this.color})
      : super(key: key);

  void selectCategory(context) {
    Navigator.of(context)
        .pushNamed(categoryMeals, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => selectCategory(context),
        borderRadius: BorderRadius.circular(16.0),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline1,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.4), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            color: color,
            borderRadius: BorderRadius.circular(16.0),
          ),
        ));
  }
}
