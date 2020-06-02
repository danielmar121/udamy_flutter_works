import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widget/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  FavoritesScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: this._favoriteMeals.isEmpty
          ? Text('you have no favorite yet - add some now')
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                  id: _favoriteMeals[index].id,
                  imageUrl: _favoriteMeals[index].imageUrl,
                  duration: _favoriteMeals[index].duration,
                  title: _favoriteMeals[index].title,
                  affordability: _favoriteMeals[index].affordability,
                  complexity: _favoriteMeals[index].complexity,
                );
              },
              itemCount: _favoriteMeals.length,
            ),
    );
  }
}
