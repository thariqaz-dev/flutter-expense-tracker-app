import 'dart:math';

import 'package:expense_tracker/core/config/app_theme.dart';
import 'package:expense_tracker/core/enums/category_enum.dart';
import 'package:expense_tracker/data/models/expense.dart';
import 'package:expense_tracker/data/models/expense_bucket.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ExpensePieChart extends StatelessWidget {
  ExpensePieChart({super.key, required this.expenses}) {
    expenseByCategory = {
      for (var category in Category.values)
        category.name:
            ExpenseBucket.forCategory(expenses, category).totalExpenses,
    };
  }

  Color getRandomColor(bool isDarkTheme) {
    final Random random = Random();
    return isDarkTheme
        ? AppTheme.KDarkColorScheme.onPrimaryContainer
        : AppTheme.kColorScheme.onPrimaryContainer;
  }

  final List<Expense> expenses;
  late final Map<String, double> expenseByCategory;

  @override
  Widget build(BuildContext context) {
    final Map<String, double> expenseByCategoryList = expenseByCategory;
    if (expenseByCategoryList.values.every((value) => value == 0)) {
      return const Center(child: Text("No expenses to display."));
    }

    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    return Expanded(
      child: PieChart(
        PieChartData(
          sections:
              expenseByCategoryList.entries.map((entry) {
                return PieChartSectionData(
                  color: getRandomColor(isDarkTheme),
                  value: entry.value,
                  title: '${entry.key}\n₹${entry.value.toStringAsFixed(0)}',
                  radius: 80,
                  titleStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                );
              }).toList(),
          sectionsSpace: 2,
          centerSpaceRadius: 40,
        ),
      ),
    );

    // return Expanded(
    //   child: PieChart(
    //     PieChartData(
    //       sections:
    //           expenseByCategoryList.entries.map((entry) {
    //             return PieChartSectionData(
    //               color: Theme.of(context).primaryColor,
    //               value: entry.value,
    //               title: '${entry.key}\n₹${entry.value.toStringAsFixed(0)}',
    //               radius: 80,
    //               titleStyle: const TextStyle(
    //                 fontSize: 12,
    //                 fontWeight: FontWeight.bold,
    //                 color: Colors.white,
    //               ),
    //             );
    //           }).toList(),
    //       sectionsSpace: 2,
    //       centerSpaceRadius: 40,
    //     ),
    //   ),
    // );
  }
}
