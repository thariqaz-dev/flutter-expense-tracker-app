import 'package:expense_tracker/core/constants/category_constant.dart';
import 'package:expense_tracker/core/enums/category_enum.dart';
import 'package:expense_tracker/data/models/expense.dart';
import 'package:expense_tracker/data/models/expense_bucket.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExpenseBarChart extends StatelessWidget {
  ExpenseBarChart({super.key, required this.expenses}) {
    barGroupData = _generateBarGroupData();
  }

  final List<Expense> expenses;
  late List<BarChartGroupData> barGroupData;

  List<BarChartGroupData> _generateBarGroupData() {
    return Category.values
        .map(
          (data) => BarChartGroupData(
            x: data.index,
            barRods: [
              BarChartRodData(
                toY: ExpenseBucket.forCategory(expenses, data).totalExpenses,
                color: CategoryConstant.categoryColors[data],
                width: 40,
                borderRadius: BorderRadius.circular(5),
              ),
            ],
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (barGroupData.isEmpty) {
      return Center(child: Text('No expense to display'));
    }

    return Card(
      child: AspectRatio(
        aspectRatio: 2.0,
        child: Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          child: BarChart(
            BarChartData(
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      return Icon(
                        CategoryConstant.categoryIcons[Category.values[value
                            .toInt()]],
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: barGroupData,
            ),
          ),
        ),
      ),
    );
  }
}
