import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onExpenseRemoved, required this.onExpenseAdded});

  final List<Expense> expenses;
  final Function(Expense) onExpenseRemoved;
  final Function(Expense) onExpenseAdded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: expenses.isEmpty
          ? Center(
              child: Text(
                'No expenses added yet!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (context, index) => Dismissible(
                key: Key(expenses[index].id),
                onDismissed: (direction) {
                  final removedExpense = expenses[index];
                  onExpenseRemoved(removedExpense);

                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Expense removed'),
                      duration: Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'UNDO',
                        onPressed: () {
                          onExpenseAdded(removedExpense);
                        },
                      ),
                    ),
                  );
                },
                child: ExpenseItem(expenses[index]),
              ),
            ),
    );
  }
}