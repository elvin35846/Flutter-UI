// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.size,
    required this.description,
    required this.image,
    required this.color,
  });
}

List<Product> products = [
  Product(
    id: 1,
    title: "Yellow Bag",
    price: 350,
    size: 10,
    description: 'dummyText',
    image: "assets/images/bag_1.png",
    color: const Color(0xFFFDEE87),
  ),
  Product(
    id: 2,
    title: "Blue Bag",
    price: 320,
    size: 12,
    description: 'dummyText',
    image: "assets/images/bag_2.png",
    color: const Color(0xFF3D82AE),
  ),
  Product(
    id: 3,
    title: "Black Bag",
    price: 320,
    size: 12,
    description: 'dummyText',
    image: "assets/images/bag_3.png",
    color: const Color(0xFF4D4D4D),
  ),
  Product(
    id: 4,
    title: "Oringe Bag",
    price: 320,
    size: 12,
    description: 'dummyText',
    image: "assets/images/bag_4.png",
    color: const Color(0xFFFF9B5C),
  ),
  Product(
    id: 5,
    title: "Red Bag",
    price: 320,
    size: 12,
    description: 'dummyText',
    image: "assets/images/bag_5.png",
    color: const Color(0xFFE57373),
  ),
  Product(
    id: 6,
    title: "Black Bag",
    price: 320,
    size: 12,
    description: 'dummyText',
    image: "assets/images/bag_6.png",
    color: const Color(0xFF4D4D4D),
  ),
  Product(
    id: 7,
    title: "Oringe Bag",
    price: 320,
    size: 12,
    description: 'dummyText',
    image: "assets/images/bag_7.png",
    color: const Color(0xFFFF9B5C),
  ),
  Product(
    id: 8,
    title: "Yellow Bag",
    price: 350,
    size: 10,
    description: 'dummyText',
    image: "assets/images/bag_1.png",
    color: const Color(0xFFFDEE87),
  ),
];
