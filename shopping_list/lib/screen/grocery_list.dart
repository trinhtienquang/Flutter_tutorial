import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/screen/new_item.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/grocery_list.dart';
import 'package:http/http.dart' as http;

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  List<GroceryItem> _groceryItem = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  void _loadItems() async {
    final url = Uri.https(
      'sample-flutter-app-a8173-default-rtdb.asia-southeast1.firebasedatabase.app',
      'shopping-list.json',
    );

    try {
      final res = await http.get(url);

      if (res.statusCode >= 400) {
        setState(() {
          _error = 'Failed to fetch data. Please try again later.';
        });
      }

      if (res.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      final Map<String, dynamic> data = json.decode(res.body);
      final List<GroceryItem> loadedItems = [];
      for (final item in data.entries) {
        final category =
            categories.entries
                .firstWhere(
                  (categoryItem) =>
                      categoryItem.value.title == item.value['category'],
                )
                .value;
        loadedItems.add(
          GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category,
          ),
        );
        setState(() {
          _groceryItem = loadedItems;
          _isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        _error = 'Failed to fetch data. Please try again later.';
      });
    }
  }

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

  void _removeItem(GroceryItem groceryItem) async {
    final index = _groceryItem.indexOf(groceryItem);
    setState(() {
      _groceryItem.remove(groceryItem);
    });

    final url = Uri.https(
      'sample-flutter-app-a8173-default-rtdb.asia-southeast1.firebasedatabase.app',
      'shopping-list/${groceryItem.id}.json',
    );

    final res = await http.delete(url);

    if (res.statusCode >= 400) {
      setState(() {
        _groceryItem.insert(index, groceryItem);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text(
        'No items added yet!',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );

    if (_isLoading) {
      mainContent = Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      mainContent = Center(
        child: Text(
          _error!,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

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
