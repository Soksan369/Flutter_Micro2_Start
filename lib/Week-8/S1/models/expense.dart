import 'package:uuid/uuid.dart';
enum ExpenseType {FOOD,TRAVEL,LEISURE,WORK}


class Expense {
  String id;
  String title;
  double amount;
  DateTime date;
  ExpenseType category;

  Expense({required this.title, required this.amount, required this.date, required this.category, String? id}): id = const Uuid().v1();
  
}

void main() {
  var expense = Expense(
    title: 'Food',
    amount: 100.0,
    date: DateTime.now(),
    category: ExpenseType.FOOD,
  );
  print(expense.id);

}