import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.shoe, required this.onDelete});

  final Shoe shoe;
  final Function() onDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Image.asset(shoe.imagePath),
        title: Text(shoe.name),
        subtitle: Text("\$${shoe.price.toStringAsFixed(0)}"),
        trailing: IconButton(onPressed: onDelete, icon: Icon(Icons.delete)),
      ),
    );
  }
}
