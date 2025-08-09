import 'package:ecommerce/components/shoe_tile.dart';
import 'package:ecommerce/models/cart.dart';
import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.symmetric(horizontal: 24),

              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Search", style: TextStyle(color: Colors.grey)),
                  Icon(Icons.search, color: Colors.grey),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Text(
                "Everyone flies.. some fly longer than others",
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hot Pics!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text("See all", style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),

            SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cart.getShoes().length,
                itemBuilder: (context, i) {
                  Shoe s = cart.getShoes()[i];
                  return ShoeTile(
                    shoe: s,
                    onTap: () {
                      cart.AddItemToCart(s);

                      showDialog(
                        context: context,
                        builder: (c) => AlertDialog(
                          title: Text("Succesfully added"),
                          content: Text("Check your cart"),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 24.0, left: 24, right: 24),
              child: Divider(color: Colors.grey[300]),
            ),
          ],
        );
      },
    );
  }
}
