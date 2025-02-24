import 'package:expense_tracker/Presentation/views/expense_item.dart';
import 'package:expense_tracker/data/models/expense.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onRemoveExpense,
  });

  final List<Expense> expenses;
  final void Function(Expense expense) onRemoveExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder:
          (ctx, idx) => Dismissible(
            key: ValueKey(expenses[idx]),
            onDismissed: (direction) => {onRemoveExpense(expenses[idx])},
            background: Container(
              color: Theme.of(context).colorScheme.error,
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              ),
            ),
            child: ExpenseItem(expenses[idx]),
          ),
    );
  }
}
