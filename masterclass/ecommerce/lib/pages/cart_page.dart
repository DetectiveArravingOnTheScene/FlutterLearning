import 'package:ecommerce/components/cart_item.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Cart",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),

              SizedBox(height: 20),

              Expanded(
                child: ListView.builder(
                  itemCount: cart.getUserCart().length,
                  itemBuilder: (context, i) {
                    Shoe s = cart.getUserCart()[i];
                    return CartItem(
                      shoe: s,
                      onDelete: () {
                        cart.RemoveFromCart(s);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
