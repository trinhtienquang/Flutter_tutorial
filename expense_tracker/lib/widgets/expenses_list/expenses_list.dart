import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expeses});

  final List<Expense> expeses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expeses.length,
      itemBuilder: (ctx, index) => ExpensesItem(expense: expeses[index]),
    );
  }
}
