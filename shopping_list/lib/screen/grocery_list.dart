import 'package:flutter/material.dart';
import 'package:shopping_list/widgets/grocery_item.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Groceries')),
      body: GroceryItem(),
    );
  }
}
