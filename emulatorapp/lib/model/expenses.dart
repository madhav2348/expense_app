import "package:flutter/material.dart";
import "package:uuid/uuid.dart";
import "package:intl/intl.dart";

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum ACategory { food, travel, work, leasure }

const categoryIcons = {
  ACategory.food: Icons.lunch_dining,
  ACategory.leasure: Icons.movie,
  ACategory.travel: Icons.travel_explore,
  ACategory.work: Icons.work
};

class ExpenseSecond {
  ExpenseSecond(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;

  final ACategory category;

  String get formattedDate => formatter.format(date); //intl pubb
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenseSecond});

  ExpenseBucket.forCategory(List<ExpenseSecond> allExpense, this.category)
      : expenseSecond =
            allExpense.where((ex) => ex.category == category).toList();

  final ACategory category;
  final List<ExpenseSecond> expenseSecond;

  double get totalExpense {
    double sum = 0;
    for (final ex in expenseSecond) {
      sum += ex.amount;
    }

    return sum;
  }
}
