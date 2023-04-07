import 'package:flutter/material.dart';
import 'dummy_data.dart';

class RecipeScreen extends StatelessWidget {
  static const String routeName = '/recipe';
  // final String categoryId;
  // final String categoryTitle;
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id']!;
    final String categoryTitle = routeArgs['title']!;
    final filteredMeals = dummyMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Text(filteredMeals[index].title);
          },
          itemCount: filteredMeals.length,
        ));
  }
}
