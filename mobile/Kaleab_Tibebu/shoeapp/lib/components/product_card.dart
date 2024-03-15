import 'package:flutter/material.dart';
import 'package:shoeapp/detail.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final double rating;

  const ProductCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductDetailsPage()),
        );
      },
      child: Card(
        elevation: 4,
        margin: const EdgeInsets.symmetric(vertical: 12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(11), // Set border radius here
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(4)),
                child: Image.asset(
                  'asset/images/jordan.jpg',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 160,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              color: Color(0xFF3E3E3E),
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins'),
                        ),
                        Text(
                          price,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Poppins'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Men's Shoe",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFAAAAAA),
                              fontFamily: 'Poppins'),
                        ),
                        Row(
                          children: <Widget>[
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "(${rating.toString()})",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFFAAAAAA)),
                            ),
                          ],
                        ),
                      ],
                    )
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
