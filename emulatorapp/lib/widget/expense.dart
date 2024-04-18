import 'package:first_app/widget/chart/total.dart';
import 'package:first_app/widget/expenselist/expenselist.dart';
import 'package:first_app/model/expenses.dart';
import 'package:first_app/widget/expenselist/newexpense.dart';

import 'package:flutter/material.dart';

class Expense extends StatefulWidget {
  @override
  const Expense({super.key});
  @override
  State<Expense> createState() {
    return _Expense();
  }
}

class _Expense extends State<Expense> {
  final List<ExpenseSecond> _registerexpense = [
    ExpenseSecond(
      title: 'A',
      amount: 0.1,
      date: DateTime.now(),
      category: ACategory.food,
    )
  ];

  void _openAddExpenses() {
    setState(() {
      
      showModalBottomSheet(
       // isScrollControlled: true,
         context: context,
         builder: (BuildContext context) =>NewExpense(onAddExpense: _addExpense)
        
         );
    //
      
      
    });
    //Navigator.pop(context); it was creating error
    
  }

  void _addExpense(ExpenseSecond expense) {
    _registerexpense.add(expense);
  }

  void removeExpense(ExpenseSecond expenseSecond) {
    final expenseIndex = _registerexpense.indexOf(expenseSecond);
    setState(() {
      _registerexpense.remove(expenseSecond);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration:const Duration(seconds: 3),
      content:const Text('Deleted'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registerexpense.insert(expenseIndex, expenseSecond);
            });
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent =const Center(
      child: Text('No Content Found click to add '),
    );

    if (_registerexpense.isNotEmpty) {
      mainContent = ExpenseList(
        expenses: _registerexpense,
        onRemove: removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar( backgroundColor: Colors.transparent,
        // title: Text(
        //     'making something'), // with canging botthomnavigation bar and in that main and cross axis alighn ments
        actions: [
          IconButton(onPressed: _openAddExpenses, icon:const Icon(Icons.add),color: Colors.black,)
        ],
      ),
      // 
      body: Column(
        children: [
          ShowTotal(expenses: _registerexpense),
          Expanded(
            child: mainContent,
          )
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 80.0,
        child: Column(
          
         
           mainAxisAlignment: MainAxisAlignment.end,
           
          children: [
            ElevatedButton(
                onPressed: _openAddExpenses, child: const Icon(Icons.add))
          ],
        ),
      ),
     // bottomNavigationBar: Row(),
    );
  }
}
