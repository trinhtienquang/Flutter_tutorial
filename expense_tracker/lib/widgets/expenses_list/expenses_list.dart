import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expeses,
    required this.onRemoveExpense,
  });

  final List<Expense> expeses;
  final void Function(Expense expense) onRemoveExpense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expeses.length,
      itemBuilder:
          (ctx, index) => Dismissible(
            background: Container(
              color: Theme.of(
                context,
              ).colorScheme.error.withValues(alpha: 0.75),
              margin: EdgeInsets.symmetric(
                horizontal: Theme.of(context).cardTheme.margin!.horizontal,
              ),
            ),
            key: ValueKey(expeses[index]),
            onDismissed: (direction) => onRemoveExpense(expeses[index]),
            child: ExpensesItem(expense: expeses[index]),
          ),
    );
  }
}
