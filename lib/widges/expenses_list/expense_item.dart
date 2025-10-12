import 'package:flutter/material.dart';
import 'package:proj_four/models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});


   final Expense expense;


  @override
  Widget build(BuildContext context) {
   
   return Card(

    child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 15
      ) ,
      child: Column(
        children: [
          Text(expense.title),
      //    Spacer(),            
          Row(
            children: [
            
            Icon(iconsCategory[expense.category]),
            
            Spacer(),
            Column(
              children: [
                Text(expense.dateFormatter),
                Text(expense.amount.toString()),
              ],
            ),
            ],
          ),
        ],
      ),
    )
   );
  }
}