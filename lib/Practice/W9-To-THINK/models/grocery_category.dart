import 'package:flutter/material.dart';

enum GroceryCategory {
  vegetables('Vegetables', Color.fromARGB(255, 0, 255, 128), Icons.local_florist),
  fruit('Fruit', Color.fromARGB(255, 145, 255, 0), Icons.local_grocery_store),
  meat('Meat', Color.fromARGB(255, 255, 102, 0), Icons.local_dining),
  dairy('Dairy', Color.fromARGB(255, 0, 208, 255), Icons.local_drink),
  carbs('Carbs', Color.fromARGB(255, 0, 60, 255), Icons.local_pizza),
  sweets('Sweets', Color.fromARGB(255, 255, 149, 0), Icons.cake),
  spices('Spices', Color.fromARGB(255, 255, 187, 0), Icons.local_bar),
  convenience('Convenience', Color.fromARGB(255, 191, 0, 255), Icons.fastfood),
  hygiene('Hygiene', Color.fromARGB(255, 149, 0, 255), Icons.local_hospital),
  other('Other', Color.fromARGB(255, 0, 225, 255), Icons.more_horiz);

  final String label;
  final Color color;
  final IconData icon;

  const GroceryCategory(this.label, this.color, this.icon);
}
