import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onSelectMeal});

  final Meal meal;
  final void Function(BuildContext context, Meal meal) onSelectMeal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(meal.title),
        ),
        body: Image.network(
          meal.imageUrl,
          width: double.infinity,
          fit: BoxFit.cover,
        ));
  }
}
