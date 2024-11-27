import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseList extends StatelessWidget {
  const ExpenseList({super.key, required this.expenses});

  final List<Expense> expenses;
  @override
  //Widget build(BuildContext context) {
  //  return Column(children: [
  //    ...expenses.map((e) => Text(e.title),)
  //  ],);
  //}
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final expense = expenses[index];
        return ListTile(
          title: Text(expense.title),
          subtitle: Text(expense.amount.toString()),
          trailing: Text(expense.date.toString()),
        );
      },
    );
  }
}