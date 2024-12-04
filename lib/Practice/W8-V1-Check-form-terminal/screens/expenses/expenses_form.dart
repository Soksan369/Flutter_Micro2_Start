import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {

  TextEditingController _titleController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  void onPressed() {
    String title = _titleController.text;
    String amount = _amountController.text;
    print("title is $title");
    print("amount is $amount");
  }
  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            controller: _amountController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Amount'),
            ),
          ),
          ElevatedButton(onPressed: onPressed, child: const Text('Check  Value')),
        ],
      ),
    );
  }
}
