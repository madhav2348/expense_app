import 'package:first_app/model/expenses.dart';
import 'package:first_app/widget/expenselist/expenseitems.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList(
      {super.key, required this.expenses, required this.onRemove});

  final List<ExpenseSecond> expenses;
  final void Function(ExpenseSecond expenseSecond) onRemove;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: ((context, index) => Dismissible(
              onDismissed: (direction) {
                onRemove(expenses[index]);
              },
              key: ValueKey(expenses[index]),
              background: Container(
                color: Theme.of(context).colorScheme.error.withOpacity(0.75),
                
                margin: EdgeInsets.symmetric(
                  horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                ),
              ),
              child: ExpenseItem(
                expenses[index],
              ),
            )
          ),
      ),
    );
  }
}
