import 'package:flutter/material.dart';
import 'cart_screen.dart'; // Import the CartScreen

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool hasNotification = false; // A boolean flag for notification alerts

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.white, // Set the solid background color (example: #FA5A2A)
        elevation: 0, // Removes shadow/elevation to make the appbar flat/plain
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Profile picture and username
            Row(
              children: [
                // Profile picture
                CircleAvatar(
                  radius: 20, // Profile picture size
                  backgroundImage: NetworkImage(
                    'https://www.example.com/profile-picture.jpg', // Replace with the actual image URL
                  ),
                ),
                SizedBox(width: 10), // Space between the image and username

                // Username
                Text(
                  'Username', // Replace with dynamic username if needed
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            // Notification and cart icons with square-oval frame
            Row(
              children: [
                // Notification icon with conditional alert inside a square with rounded corners
                Container(
                  padding: EdgeInsets.all(8), // Padding inside the frame
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color for the frame
                    borderRadius: BorderRadius.circular(12), // Oval corners
                  ),
                  child: IconButton(
                    icon: Icon(
                      hasNotification
                          ? Icons.notifications_active
                          : Icons
                              .notifications, // Change icon if there's a notification
                      color: Colors.black, // Icon color
                    ),
                    onPressed: () {
                      setState(() {
                        // Toggle the notification alert for demonstration
                        hasNotification = !hasNotification;
                      });
                    },
                  ),
                ),

                SizedBox(
                    width: 10), // Space between notification and cart icons

                // Cart icon inside a square with rounded corners
                Container(
                  padding: EdgeInsets.all(8), // Padding inside the frame
                  decoration: BoxDecoration(
                    color: Colors.white, // Background color for the frame
                    borderRadius: BorderRadius.circular(12), // Oval corners
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: Colors.black, // Icon color
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: "Find what you need...",
                prefixIcon:
                    Icon(Icons.search, color: Colors.grey), // Search icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200], // Background color of search bar
              ),
            ),

            SizedBox(
                height: 16), // Space between search bar and deliver to section

            // Deliver to section
            Row(
              children: [
                Icon(Icons.location_pin,
                    color: Color(0xFFFA5A2A)), // Map pin icon
                SizedBox(width: 5), // Space between icon and text
                Expanded(
                  child: Text(
                    "Deliver to: Jl. Rose No.123 Block A, Cipete, South Jakarta",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                    overflow: TextOverflow.ellipsis, // Ellipsis for long text
                  ),
                ),
                Icon(Icons.map,
                    color: Color(
                        0xFFFA5A2A)), // Map icon (can be made clickable if needed)
              ],
            ),

            SizedBox(
                height:
                    16), // Space between deliver to section and the rest of the content
          ],
        ),
      ),
    );
  }
}

class CategoriesScreen extends StatelessWidget {
  // List of categories with corresponding icons
  final List<Map<String, dynamic>> categories = [
    {"name": "Electronic", "icon": Icons.electrical_services},
    {"name": "Food & Drink", "icon": Icons.fastfood},
    {"name": "Accessories", "icon": Icons.watch},
    {"name": "Beauty", "icon": Icons.brush},
    {"name": "Fashion", "icon": Icons.shopping_bag},
    {"name": "Furniture", "icon": Icons.chair},
    {"name": "Health", "icon": Icons.local_hospital},
    {"name": "Stationary", "icon": Icons.edit},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Color(0xFFFA5A2A),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // 4 items per row
            crossAxisSpacing: 10.0, // Spacing between items horizontally
            mainAxisSpacing: 10.0, // Spacing between items vertically
            childAspectRatio: 1, // Square shape
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryItem(
              name: categories[index]['name'],
              icon: categories[index]['icon'],
            );
          },
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String name;
  final IconData icon;

  CategoryItem({required this.name, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle category click here, e.g., navigate to another screen
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Circular container with icon
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.grey, // Thin border color
                width: 1.0, // Border thickness
              ),
            ),
            child: Icon(
              icon,
              size: 30, // Icon size
              color: Color(0xFFFA5A2A), // Icon color
            ),
          ),

          SizedBox(height: 8), // Space between icon and text

          // Category name
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis, // To handle long names
          ),
        ],
      ),
    );
  }
}
