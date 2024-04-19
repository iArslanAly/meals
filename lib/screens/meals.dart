import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meal_details.dart';
import 'package:meals/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
          meal: meal,
          onSelectMeal: (BuildContext context, Meal meal) {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget content;
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.warning),
            Text('No meals found',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
            const SizedBox(height: 8),
            Text('Please select a different category.',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
          ],
        ),
      );
    } else {
      content = ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(
          meal: meals[index],
          onSelectMeal: (meal) {
            selectMeal(context, meal);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
