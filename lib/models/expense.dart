import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

// Generate unique ID
final uuid= Uuid();

// Date convertor variable
final dateFormat = DateFormat.yMd();

enum Category {
food, travel, leisure, work
}

// Map object associates Category enum to icon Map<Category, Icons>
const iconsCategory = {

    Category.food : Icons.launch_rounded,
    Category.leisure : Icons.movie,
    Category.travel : Icons.travel_explore,
    Category.work : Icons.work

};

class  Expense {
Expense({required this.title, 
required this.amount, 
required this.date,
required this.category}): id = uuid.v4();

final String id;
final String title;
final double amount;
final DateTime date; 
final Category category;


// Getter returning a date human readable format 
String get dateFormatter {

return dateFormat.format(date);

}

}