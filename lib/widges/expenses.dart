import 'package:flutter/material.dart';
import 'package:proj_four/widges/expenses_list/expenses_list.dart';
import 'package:proj_four/models/expense.dart';
import 'package:proj_four/widges/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}


class _ExpensesState extends State<Expenses> {

final List<Expense> registeredExpenses = [

  Expense(title: 'Travel', amount: 300.75, 
  date: DateTime.now(), category: Category.travel),

  Expense(title: 'Leisure', amount: 10000, 
  date: DateTime.now(), category: Category.leisure)
];

void _addEXpenseButton(){
  showModalBottomSheet(context: context, isScrollControlled: true,
  builder: (ctx){
      return NewExpense();
  } );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add expense'),
        actions: [
          IconButton(onPressed: _addEXpenseButton, 
          icon: Icon(Icons.search))
        ],
      ),
      body: Column(
        children: [
          Text('Expense widget'),
          Expanded(child: ExpensesList(expenses: registeredExpenses)) ,
        ],
      ),
    );
  }
}