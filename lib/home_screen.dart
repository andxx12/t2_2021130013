import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:t2_2021130013/cart_screen.dart'; // for hiding the debug banner

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Flat app bar
        toolbarHeight: 80,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                // Profile photo
                CircleAvatar(
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                  radius: 22,
                ),
                SizedBox(width: 10),
                // Username text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "LuxeShop",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Welcome back!",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // Cart and Notification Icons
            Row(
              children: [
                // Notification Icon
                Stack(
                  children: [
                    IconButton(
                      icon: Icon(Icons.notifications_outlined,
                          color: Colors.black),
                      onPressed: () {
                        // Handle notification click
                      },
                    ),
                    // Notification alert badge (if any)
                    Positioned(
                      right: 10,
                      top: 10,
                      child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '1',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                // Cart Icon
                IconButton(
                  icon: Icon(Icons.shopping_cart_outlined, color: Colors.black),
                  onPressed: () {
                    // Navigate to cart_screen.dart
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartScreen()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Find what you need...',
                        ),
                      ),
                    ),
                    Icon(Icons.mic, color: Colors.grey),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Delivery Location
              Row(
                children: [
                  Icon(Icons.location_on_outlined, color: Colors.grey),
                  SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      "Deliver to Jl. Rose No. 123, Cipete Sub-District",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ],
              ),
              SizedBox(height: 20),
              // Categories Grid
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        child: Icon(
                          categories[index]['icon'],
                          color: Color(0xFFFA5A2A),
                          size: 30,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        categories[index]['name'],
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: 20),

              // Flash Sale Section
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "6.6 Flash Sale",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Cashback Up to 100%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductCard(),
                        ProductCard(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ProductCard Widget for Flash Sale
class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            'https://via.placeholder.com/140x100',
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Text(
            'Ipad Pro 11"',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'IDR 15.299.000',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '6% Off',
            style: TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// List of categories for the grid
final List<Map<String, dynamic>> categories = [
  {"name": "Electronic", "icon": Icons.devices},
  {"name": "Food & Drink", "icon": Icons.fastfood},
  {"name": "Accessories", "icon": Icons.watch},
  {"name": "Beauty", "icon": Icons.brush},
  {"name": "Furniture", "icon": Icons.chair},
  {"name": "Fashion", "icon": Icons.checkroom},
  {"name": "Health", "icon": Icons.local_hospital},
  {"name": "Stationary", "icon": Icons.create},
];
