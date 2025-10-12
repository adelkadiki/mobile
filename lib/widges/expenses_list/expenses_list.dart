import 'package:flutter/material.dart';
import 'package:proj_four/models/expense.dart';
import 'package:proj_four/widges/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;
  

  @override
  Widget build(BuildContext context) {
  
    return ListView.builder(
      itemCount: expenses.length, itemBuilder: (context, index){

          return ExpenseItem(expense: expenses[index]) ;
      }
      );
  }
}