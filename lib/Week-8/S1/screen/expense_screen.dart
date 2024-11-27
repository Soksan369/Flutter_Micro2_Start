import 'package:flutter/material.dart';
import 'package:flutter_start_pro/Week-8/S1/screen/expense_list.dart';
import '../models/expense.dart';
class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({super.key});

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  @override
  Widget build(BuildContext context) {
    final expenses = <Expense>[
      Expense(
          title: 'Food',
          amount: 100.0,
          date: DateTime.now(),
          category: ExpenseType.FOOD,
        ),
        Expense(
          title: 'Travel',
          amount: 200.0,
          date: DateTime.now(),
          category: ExpenseType.TRAVEL,
        ),
        Expense(
          title: 'Leisure',
          amount: 300.0,
          date: DateTime.now(),
          category: ExpenseType.LEISURE,
        ),
        Expense(
          title: 'Work',
          amount: 400.0,
          date: DateTime.now(),
          category: ExpenseType.WORK,
        ),
    ]; 
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                expenses.add(Expense(
                  title: 'New Expense',
                  amount: 500.0,
                  date: DateTime.now(),
                  category: ExpenseType.WORK,
                ));
              });
            },
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: Text('Expense App Screen')),
      body: ExpenseList(expenses: expenses),
    );
  }
}
void main() {
  runApp(MaterialApp(home: ExpenseScreen()));
}