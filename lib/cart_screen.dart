import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        backgroundColor: Color(0xFFFA5A2A),
      ),
      body: Center(
        child: Text('Your Cart is Empty'),
      ),
    );
  }
}
