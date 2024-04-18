import 'package:first_app/model/expenses.dart';
import 'package:flutter/material.dart';

class ShowTotal extends StatelessWidget {
  const ShowTotal({super.key, required this.expenses});

  final List<ExpenseSecond> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, ACategory.food),
      ExpenseBucket.forCategory(expenses, ACategory.leasure),
      ExpenseBucket.forCategory(expenses, ACategory.travel),
      ExpenseBucket.forCategory(expenses, ACategory.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    for (final bucket in buckets) {
      if (bucket.totalExpense > maxTotalExpense) {
        maxTotalExpense = bucket.totalExpense;
      }
    }

    return maxTotalExpense;
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.primary.withOpacity(0.3),
            Theme.of(context).colorScheme.primary.withOpacity(0.0)
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround, 
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  for (final bucket in buckets) // alternative to map()
                    Text(' ${bucket.totalExpense }',style:const TextStyle(fontSize: 20.0),)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: buckets
                .map(
                  (bucket) => Expanded( 
                    child: Icon(
                      categoryIcons[bucket.category],
                      color: isDarkMode
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.7),
                    ),
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
