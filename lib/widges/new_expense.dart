import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proj_four/models/expense.dart';
import 'package:proj_four/widges/expenses.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  final void Function(Expense expense) addExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  String _typtedTitle = '';

  void _saveTitle(String title) {
    _typtedTitle = title;
  }

  final _titleTextController = TextEditingController();
  final _amountTextController = TextEditingController();
  DateTime? _selectedDate;
  Category? _selectedCategory;

// Disposing the TextEditingController variable from memory
  @override
  void dispose() {
    _titleTextController.dispose();
    _amountTextController.dispose();
    super.dispose();
  }

  // Date picker handler method
  void _displayDatePicker() async {
    final now = DateTime.now();
    final datePicker = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: DateTime(1900),
        lastDate: now);

    setState(() {
      _selectedDate = datePicker;
    });
  }

  // Validate the submitted data
  void _validateSubmittedData() {
    final amount = double.tryParse(_amountTextController.text);

    if (amount == null) {
      _showErrorDialog('Amount', 'Enter the amount');
      return;
    }

    if (amount < 0) {
      _showErrorDialog('Amount', 'Amount has to be more than 1');
      return;
    }

    if (_titleTextController.text.trim().isEmpty) {
      _showErrorDialog('Title', 'No Title was entered');
      return;
    }

    if (_selectedDate == null) {
      _showErrorDialog('Date', 'No Date was entered');
      return;
    }

    if (_selectedCategory == null) {
      _showErrorDialog('Category', 'No Category was entered');
      return;
    }

    widget.addExpense(Expense(
        title: _titleTextController.text.trim(),
        amount: amount,
        date: _selectedDate!,
        category: _selectedCategory!));
    Navigator.pop(context);
  }

  void _showErrorDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: FractionallySizedBox(
        heightFactor: 0.75,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 35),
              TextField(
                controller: _titleTextController, // Text field controller
                maxLength: 40,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.greenAccent,
                  labelText: 'Title',
                  hintText: 'e.g.. Education',
                ),
              ),

              TextField(
                controller: _amountTextController,
                decoration: const InputDecoration(
                  prefixText: '\$',
                  filled: true,
                  fillColor: Colors.greenAccent,
                  labelText: 'Amount',
                  hintText: 'e.g., 123.45',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(width: 10),
              Text(_selectedDate == null
                  ? 'No selected date'
                  : DateFormat('yyyy-MM-dd').format(_selectedDate!)),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  // Date picker Row
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButton<Category>(
                        value: _selectedCategory,
                        hint: Text('Select category'),
                        items: Category.values
                            .map((categ) => DropdownMenuItem<Category>(
                                value: categ,
                                child: Text(categ.name.toUpperCase())))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            if (value != null) {
                              _selectedCategory = value;
                            } else {
                              return;
                            }
                            print(_selectedCategory);
                          });
                        }),
                    const Spacer(),
                    Text('Select a date'),
                    IconButton(
                        onPressed: _displayDatePicker,
                        icon: Icon(Icons.calendar_month))
                  ],
                ),
              ), // Date picker Row
              SizedBox(width: 10),

              Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel')),
                  Spacer(),
                  ElevatedButton(
                    onPressed: _validateSubmittedData, // Validating the data
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
