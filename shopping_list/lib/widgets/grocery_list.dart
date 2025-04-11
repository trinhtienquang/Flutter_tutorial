import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({
    super.key,
    required this.groceryItem,
    required this.onRemoveGrocertyItem,
  });

  final List<GroceryItem> groceryItem;
  final Function(GroceryItem groceryItem) onRemoveGrocertyItem;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: groceryItem.length,
      itemBuilder:
          (ctx, index) => Dismissible(
            key: ValueKey(groceryItem[index].id),
            child: ListTile(
              title: Text(groceryItem[index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: groceryItem[index].category.color,
              ),
              trailing: Text(groceryItem[index].quantity.toString()),
            ),
            onDismissed:
                (direction) => onRemoveGrocertyItem(groceryItem[index]),
          ),
    );
  }
}
