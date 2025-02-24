import 'package:expense_tracker/core/enums/category_enum.dart';
import 'package:expense_tracker/data/models/expense.dart';

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  // ExpenseBucket.forCategory(List<Expense> allExpense, this.category)
  //   : expenses = allExpense.where(
  //       (expense) => expense.category == category,
  //     ).toList();
  // Factory constructor to filter expenses by category
  factory ExpenseBucket.forCategory(
    List<Expense> allExpenses,
    Category category,
  ) {
    final filteredExpenses =
        allExpenses.where((e) => e.category == category).toList();
    return ExpenseBucket(category: category, expenses: filteredExpenses);
  }
  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }
    return sum;
  }
}
