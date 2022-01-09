import 'package:flutter/material.dart';
import 'package:mealapp/constants/constants.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  Widget buildListTile(
      context, String title, IconData icon, String tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 24.0,
      ),
      title: Text(
        title,
        style: const TextStyle(
            fontSize: 24.0,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold),
      ),
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(tapHandler);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120.0,
            width: double.infinity,
            padding: const EdgeInsets.all(18.0),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          buildListTile(context, 'Meal', Icons.restaurant, home),
          buildListTile(context, 'Filters', Icons.settings, filterScreen),
        ],
      ),
    );
  }
}
