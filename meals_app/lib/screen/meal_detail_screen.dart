import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import '../dummy_data.dart';

Widget _buildSectionTitle(BuildContext context, String sectionTitle) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: 10,
    ),
    child: Text(
      sectionTitle,
      style: Theme.of(context).textTheme.title,
    ),
  );
}

Widget _buildContainer(Widget child) {
  return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: 300,
      child: child);
}

Widget _buildIngredientsList(Object context, Meal selectedMeal) {
  return ListView.builder(
    itemBuilder: (ctx, index) => Card(
      color: Theme.of(context).accentColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 10,
        ),
        child: Text(selectedMeal.ingredients[index]),
      ),
    ),
    itemCount: selectedMeal.ingredients.length,
  );
}

Widget _buildStepsList(BuildContext context, Meal selectedMeal) {
  return ListView.builder(
    itemBuilder: (ctx, index) => Column(children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          child: Text('# ${(index + 1)}'),
        ),
        title: Text(selectedMeal.steps[index]),
      ),
      Divider()
    ]),
    itemCount: selectedMeal.steps.length,
  );
}

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.isFavorite, this.toggleFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    print(mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 220,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle(context, "ingredients"),
            _buildContainer(
              _buildIngredientsList(
                context,
                selectedMeal,
              ),
            ),
            _buildSectionTitle(context, "Steps"),
            _buildContainer(
              _buildStepsList(
                context,
                selectedMeal,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          this.isFavorite(mealId) ? Icons.star : Icons.star_border,
          color: Colors.white,
          size: 40,
        ),
        onPressed: () => this.toggleFavorite(mealId),
      ),
    );
  }
}
