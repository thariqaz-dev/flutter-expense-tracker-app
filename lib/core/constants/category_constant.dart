import 'package:expense_tracker/core/enums/category_enum.dart';
import 'package:flutter/material.dart';

class CategoryConstant {
  static const categoryIcons = {
    Category.food: Icons.lunch_dining,
    Category.travel: Icons.flight_takeoff,
    Category.leisure: Icons.movie,
    Category.work: Icons.work,
  };

  static const categoryColors = {
    Category.food: Colors.blueAccent,
    Category.travel: Colors.orangeAccent,
    Category.leisure: Colors.greenAccent,
    Category.work: Colors.purpleAccent,
  };
}
