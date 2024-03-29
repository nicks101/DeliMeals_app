import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/fliters_screen';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(
    this.currentFilters,
    this.saveFilters,
  );

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;

  @override
  initState() {
    _isGlutenFree = widget.currentFilters['gluten'];
    _isVegan = widget.currentFilters['vegan'];
    _isVegetarian = widget.currentFilters['vegetarian'];
    _isLactoseFree = widget.currentFilters['lactose'];

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    bool currentValue,
    Function changeSwitch,
  ) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        value: currentValue,
        onChanged: changeSwitch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _isGlutenFree,
                'vegan': _isVegan,
                'vegetarian': _isVegetarian,
                'lactose': _isLactoseFree,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(40),
            child: Text(
              'Apply filters for your meal',
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 18,
              ),
            ),
          ),
          _buildSwitchListTile(
            'Gluten Free',
            'Only show gluten free meals',
            _isGlutenFree,
            (newValue) {
              setState(() {
                _isGlutenFree = newValue;
              });
            },
          ),
          _buildSwitchListTile(
            'Vegan',
            'Only show vegan meals',
            _isVegan,
            (newValue) {
              setState(() {
                _isVegan = newValue;
              });
            },
          ),
          _buildSwitchListTile(
            'Vegetarian',
            'Only show vegetarian meals',
            _isVegetarian,
            (newValue) {
              setState(() {
                _isVegetarian = newValue;
              });
            },
          ),
          _buildSwitchListTile(
            'Luctose Free',
            'Only show luctose free meals',
            _isLactoseFree,
            (newValue) {
              setState(() {
                _isLactoseFree = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
