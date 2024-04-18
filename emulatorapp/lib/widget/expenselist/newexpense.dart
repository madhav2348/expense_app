import 'package:flutter/material.dart';
import 'package:first_app/model/expenses.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final Function(ExpenseSecond expenseSecond) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpense();
}

class _NewExpense extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  ACategory _selectedCategory = ACategory.food;
  void _datePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final picked = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate:
            now); // i was thinking if i create aform i shouldnt use now at innitial balr

    setState(() {
      _selectedDate = picked;
    });
  }
  //
  //alternatve of title controller
  //var _enterTitle = '';

  // void _saveTitle(String input) {
  //   _enterTitle = input;
  // }

  void _submitData() {
    final enteredamount = double.tryParse(_amountController
        .text); //try parse(''hello'')=null but tryparse('2.25') = 2.25
    final amountValid = enteredamount == null || enteredamount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountValid ||
        _selectedDate == null) {
      //error message
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text('Ivalid Input'),
                content: const Text('Make sure  valid input'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(ctx);
                    },
                    child: const Text('Okay'),
                  )
                ],
              ));
      return;
    }
    widget.onAddExpense(ExpenseSecond(
        title: _titleController.text,
        amount: enteredamount,
        date: _selectedDate!,
        category: _selectedCategory));
     Navigator.pop(context);

  }

  @override
  void dispose() {
    _amountController.dispose();
    _titleController.dispose();

    // make shure to dispose every textcontroleer in flutter so it will not be at background even  we switch to next wiget
    //hygiene way

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.fromLTRB(16.0,48.0,16.0,16.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            //_saveTitle,
            maxLength: 50,
            decoration:const InputDecoration(label: Text('title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  //_saveTitle,
                  maxLength: 50,
                  decoration: const InputDecoration(
                    label:Text('Amount'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 16.0,
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(_selectedDate == null
                  ? 'NO date selected'
                  : formatter.format(_selectedDate!)),
              IconButton(
                  onPressed: _datePicker, icon: const Icon(Icons.calendar_month))
            ],
          )),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedCategory,
                  items: ACategory.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(
                            category.name.toString(),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == null) {
                        return;
                      }
                      _selectedCategory = value;
                    });
                  }),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child:const Text('Cancel')),
              ElevatedButton(
                  onPressed: _submitData,
                  //print(_enterTitle);
                  //printamotcontrol
                  //print textcontrol

                  child: const Text('SAve title'))
            ],
          )
        ],
      ),
    );
  }
}
