import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "My Cart",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return CartItemCard(
                    productName: item['productName'],
                    price: item['price'],
                    imageUrl: item['imageUrl'],
                    discount: item['discount'],
                    size: item['size'],
                  );
                },
              ),
            ),
            // Checkout Section
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "IDR 3,499,000",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      // Proceed to checkout functionality
                    },
                    child: Text(
                      "Checkout",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItemCard extends StatelessWidget {
  final String productName;
  final String price;
  final String imageUrl;
  final String discount;
  final String size;

  const CartItemCard({
    Key? key,
    required this.productName,
    required this.price,
    required this.imageUrl,
    required this.discount,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Image.network(
            imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 16),
          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    // Size Dropdown
                    DropdownButton<String>(
                      value: size,
                      onChanged: (newValue) {
                        // Handle size change
                      },
                      items: <String>['S', 'M', 'L', 'XL']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Spacer(),
                    // Quantity Control
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              // Decrease quantity
                            },
                          ),
                          Text("1"),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              // Increase quantity
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Remove Item Button
          IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.grey),
            onPressed: () {
              // Remove item from cart
            },
          ),
        ],
      ),
    );
  }
}

// Sample Cart Items Data
List<Map<String, dynamic>> cartItems = [
  {
    "productName": "Apple Watch Ultra 2 with Ocean Band",
    "price": "IDR 15,999,000",
    "imageUrl": "https://via.placeholder.com/80",
    "discount": "10% off",
    "size": "M",
  },
  {
    "productName": "AirPods Pro 2nd generation with USB-C",
    "price": "IDR 3,499,000",
    "imageUrl": "https://via.placeholder.com/80",
    "discount": "10% off",
    "size": "M",
  },
  {
    "productName": "Adicolor Neoclassics Men's Hoodie",
    "price": "IDR 1,500,000",
    "imageUrl": "https://via.placeholder.com/80",
    "discount": "7% off",
    "size": "L",
  },
];
