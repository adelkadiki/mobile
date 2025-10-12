import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}



class _NewExpenseState extends State<NewExpense> {

String _typtedTitle ='';

void _saveTitle(String title){
_typtedTitle = title;
}

final _titleTextController = TextEditingController();
final _amountTextController = TextEditingController();

// Disposing the TextEditingController variable from memory
@override
  void dispose() {
    _titleTextController.dispose();
    _amountTextController.dispose();
    super.dispose();
  }

  // Date picker handler method
  void _displayDatePicker(){
    final now = DateTime.now();
        showDatePicker(context: context, 
        initialDate: now,
        firstDate: DateTime(1900) , 
        lastDate: DateTime(DateTime.now().year));
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
              controller: _titleTextController,  // Text field controller
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
                    Row(           // Date picker Row
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text('Select a date'), 
                         IconButton(
                          onPressed: _displayDatePicker, 
                          icon: Icon(Icons.calendar_month))
                      ],
                    ),            // Date picker Row
                    SizedBox(width: 10),
          
             Row(
         //     mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                child: const Text('Cancel')
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    
                    print(_titleTextController.text);
                    print(_amountTextController.text);
                    
                  },
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