import 'package:flutter/material.dart';
import 'package:shopping_list/screen/new_item.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/grocery_list.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  final List<GroceryItem> _groceryItem = [];

  void _addItem() async {
    final newItem = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => NewItemScreen()));

    if (newItem == null) {
      return;
    }

    setState(() {
      _groceryItem.add(newItem);
    });
  }

  void _removeItem(GroceryItem groceryItem) {
    setState(() {
      _groceryItem.remove(groceryItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text(
        'No items added yet!',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );

    if (_groceryItem.isNotEmpty) {
      mainContent = GroceryList(
        groceryItem: _groceryItem,
        onRemoveGrocertyItem: _removeItem,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: Icon(Icons.add))],
      ),
      body: mainContent,
    );
  }
}
