import 'package:ecommerce/models/shoe.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  final List<Shoe> _shoeShop = [
    Shoe(
      name: "Meow",
      price: 100,
      imagePath: "lib/images/1.jpg",
      description: "Scary",
    ),
    Shoe(
      name: "Meow2",
      price: 120,
      imagePath: "lib/images/2.jpeg",
      description: "Scary",
    ),
    Shoe(
      name: "Meow3",
      price: 300,
      imagePath: "lib/images/3.jpg",
      description: "Scary",
    ),
    Shoe(
      name: "Meow4",
      price: 240,
      imagePath: "lib/images/4.jpg",
      description: "Scary",
    ),
  ];

  List<Shoe> _userCart = [];

  List<Shoe> getShoes() {
    return _shoeShop;
  }

  List<Shoe> getUserCart() {
    return _userCart;
  }

  void AddItemToCart(Shoe s) {
    _userCart.add(s);
    notifyListeners();
  }

  void RemoveFromCart(Shoe s) {
    _userCart.remove(s);
    notifyListeners();
  }
}
