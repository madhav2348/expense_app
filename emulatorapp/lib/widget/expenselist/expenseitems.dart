import 'package:flutter/material.dart';
import 'package:first_app/model/expenses.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem(this.expense, {super.key});
  final ExpenseSecond expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 1.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(1)}',),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcons[categoryIcons[expense]],
                    ),
                    const SizedBox(
                      width: 18.0,
                    ),
                    Text(expense.formattedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
