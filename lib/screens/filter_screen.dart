import 'package:flutter/material.dart';

import 'package:mealapp/screens/drawer/mydrawer.dart';

class FilterScreen extends StatefulWidget {
  late Function saveFilters;
  late Map currentFilters;
  FilterScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
   _lactoseFree = widget.currentFilters['lactose'];
   _vegan = widget.currentFilters['vegan'];
   _vegetarian = widget.currentFilters['vegeterian'];
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      activeColor: Theme.of(context).colorScheme.secondary,
      value: currentValue,
      title: Text(title),
      onChanged: updateValue as Function(bool),
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 14.0),
            child: IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                Map selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegeterian': _vegetarian
                };
                widget.saveFilters(selectedFilters);
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Adjust your selection',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                    'Gluten-Free',
                    'Only incloude gluten-free meals',
                    _glutenFree, (bool newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Lactose-Free',
                    'Only incloude lactose-free meals',
                    _lactoseFree, (bool newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegan', 'Only incloude vegan meals', _vegan,
                    (bool newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                buildSwitchListTile(
                    'Vegetarian', 'Only incloude vegetarian meals', _vegetarian,
                    (bool newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
