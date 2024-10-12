import 'package:flutter/material.dart';

class FindScreen extends StatelessWidget {
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
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Find what you need...',
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt_outlined, color: Colors.black),
            onPressed: () {
              // Handle filter functionality
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Popular Search Section
              Text(
                "Popular Search",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: popularSearch.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  return PopularSearchItem(
                    name: popularSearch[index],
                  );
                },
              ),
              SizedBox(height: 24),
              // Recommend for You Section
              Text(
                "Recommend for You",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: recommendedItems.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final item = recommendedItems[index];
                  return RecommendedItem(
                    imageUrl: item['imageUrl'],
                    name: item['name'],
                    price: item['price'],
                    discount: item['discount'],
                    location: item['location'],
                    sold: item['sold'],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularSearchItem extends StatelessWidget {
  final String name;

  const PopularSearchItem({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle popular search item click
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          name,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}

class RecommendedItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  final String discount;
  final String location;
  final String sold;

  const RecommendedItem({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.discount,
    required this.location,
    required this.sold,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle product item click
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              spreadRadius: 2,
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            SizedBox(height: 8),
            // Product Details
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    price,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        discount,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        "$sold sold",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    location,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

// Sample Popular Search Data
List<String> popularSearch = [
  "Fossil Watch",
  "Iphone 14 Pro",
  "Gaming Chair",
  "New Balance",
];

// Sample Recommended Items Data
List<Map<String, dynamic>> recommendedItems = [
  {
    "name": "Uniqlo Basic T-shirt Oversized White",
    "price": "IDR 200,000",
    "discount": "19% off",
    "sold": "519",
    "location": "Surabaya",
    "imageUrl": "https://via.placeholder.com/150",
  },
  {
    "name": "New Balance 550 Men's Sneakers Shoes - Beige",
    "price": "IDR 1,792,650",
    "discount": "9% off",
    "sold": "814",
    "location": "Malang",
    "imageUrl": "https://via.placeholder.com/150",
  },
  {
    "name": "Apple Watch Ultra 2 with Alpine",
    "price": "IDR 15,999,000",
    "discount": "7% off",
    "sold": "92",
    "location": "Jakarta",
    "imageUrl": "https://via.placeholder.com/150",
  },
  {
    "name": "Nike Dri-FIT Academy Woven",
    "price": "IDR 1,499,000",
    "discount": "10% off",
    "sold": "212",
    "location": "Bandung",
    "imageUrl": "https://via.placeholder.com/150",
  },
];
