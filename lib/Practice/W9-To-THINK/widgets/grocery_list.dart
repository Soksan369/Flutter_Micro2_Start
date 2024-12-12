import 'package:flutter/material.dart';
import 'package:flutter_start_pro/Practice/W9-FORM-CORRECTION/screens/expenses/expenses_statistics_item.dart';
import 'package:flutter_start_pro/Practice/W9-To-THINK/models/grocery_category.dart';
import 'package:flutter_start_pro/Practice/W9-To-THINK/widgets/new_item.dart';
import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              //margin: const EdgeInsets.all(8),
              width: 24,
              height: 24,
              color: dummyGroceryItems[index].category.color,
              child: Icon(dummyGroceryItems[index].category.icon),
            ),
            title: Text(dummyGroceryItems[index].name),
            subtitle: Text(dummyGroceryItems[index].category.name),
            trailing: Text('${dummyGroceryItems[index].quantity}'),
            
          );
        },
      );
    
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewItem(),
                ),
              )
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
