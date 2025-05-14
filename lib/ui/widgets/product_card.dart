import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  String imageURL;
  num price;
  String name;

  ProductCard({required this.imageURL, required this.price, required this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: Image.network(
                  imageURL,
                  width: 120,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                name,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$$price",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      children: [
                        ColorDot(Colors.black),
                        ColorDot(Colors.blue),
                        ColorDot(Colors.orange),
                        const SizedBox(width: 3),
                        InkWell(onTap: (){}, child: const CircleAvatar(child: Text('+2', style: TextStyle(fontSize: 7, fontWeight: FontWeight.bold),), backgroundColor: Colors.white, radius: 7,))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: (){},
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(10),
                  ),
                ),
                child: const Icon(Icons.favorite_border, color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  final Color color;
  ColorDot(this.color);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(right: 5),
        width: 15,
        height: 15,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 1.5),
        ),
      ),
    );
  }
}
