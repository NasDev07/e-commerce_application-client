import 'package:ecommerce_application/produk/produk.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Product> cartItems;

  CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return ListTile(
            leading: Image.asset(
              'assets/${product.image}',
              width: 50.0,
              height: 50.0,
            ),
            title: Text(product.name),
            subtitle: Text(product.price),
          );
        },
      ),
    );
  }
}
