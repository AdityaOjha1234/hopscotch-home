import 'package:flutter/material.dart';

class Product {
  const Product({
    required this.name,
    required this.brand,
    required this.price,
    required this.mrp,
    required this.icon,
    required this.color,
    this.currency = 'Rs. ',
  });

  final String name;
  final String brand;
  final double price;
  final double mrp;
  final IconData icon;
  final Color color;
  final String currency;

  int get discount => (((mrp - price) / mrp) * 100).round();

  static String _fmt(double v) =>
      v == v.roundToDouble() ? v.toStringAsFixed(0) : v.toStringAsFixed(2);

  String get priceText => '$currency${_fmt(price)}';
  String get mrpText => '$currency${_fmt(mrp)}';

  /// Builds a Product from one item of the DummyJSON /products response.
  factory Product.fromJson(Map<String, dynamic> json, int index) {
    final price = (json['price'] as num).toDouble();
    final discountPct = ((json['discountPercentage'] ?? 10) as num).toDouble();
    final safePct = discountPct.clamp(1.0, 90.0).toDouble();
    return Product(
      name: (json['title'] ?? 'Product') as String,
      brand: (json['brand'] ?? json['category'] ?? '') as String,
      price: price,
      mrp: price / (1 - safePct / 100),
      icon: _icons[index % _icons.length],
      color: _colors[index % _colors.length],
      currency: '\$',
    );
  }

  static const List<IconData> _icons = [
    Icons.checkroom,
    Icons.toys,
    Icons.directions_walk,
    Icons.child_friendly,
  ];

  static const List<Color> _colors = [
    Color(0xFFDCEBFF),
    Color(0xFFFFDCEB),
    Color(0xFFFFF1C9),
    Color(0xFFDDF5E3),
    Color(0xFFEBDDFB),
    Color(0xFFFFE3D6),
  ];
}

class BannerItem {
  const BannerItem({
    required this.title,
    required this.subtitle,
    required this.color,
  });

  final String title;
  final String subtitle;
  final Color color;
}

class CategoryItem {
  const CategoryItem({
    required this.label,
    required this.icon,
    required this.color,
  });

  final String label;
  final IconData icon;
  final Color color;
}

const List<String> navCategories = [
  'Boys',
  'Girls',
  'Baby',
  'Toys',
  'Footwear',
  'Accessories',
  'Sale',
];

const List<BannerItem> banners = [
  BannerItem(
    title: 'New Season Styles',
    subtitle: 'Up to 50% off on kids fashion',
    color: Color(0xFF67218C),
  ),
  BannerItem(
    title: 'Little Ones, Big Smiles',
    subtitle: 'Baby essentials starting at Rs. 299',
    color: Color(0xFFE0457B),
  ),
  BannerItem(
    title: 'Playtime Specials',
    subtitle: 'Toys and games your kids will love',
    color: Color(0xFF2A9D8F),
  ),
];

const List<CategoryItem> categories = [
  CategoryItem(label: 'Boys', icon: Icons.boy, color: Color(0xFFDCEBFF)),
  CategoryItem(label: 'Girls', icon: Icons.girl, color: Color(0xFFFFDCEB)),
  CategoryItem(
      label: 'Baby', icon: Icons.child_friendly, color: Color(0xFFFFF1C9)),
  CategoryItem(
      label: 'Toys', icon: Icons.toys, color: Color(0xFFDDF5E3)),
  CategoryItem(
      label: 'Footwear',
      icon: Icons.directions_walk,
      color: Color(0xFFEBDDFB)),
  CategoryItem(
      label: 'Accessories',
      icon: Icons.watch_outlined,
      color: Color(0xFFFFE3D6)),
];

const List<Product> trendingProducts = [
  Product(
      name: 'Cotton Printed T-Shirt',
      brand: 'Little Kicks',
      price: 399,
      mrp: 699,
      icon: Icons.checkroom,
      color: Color(0xFFDCEBFF)),
  Product(
      name: 'Floral Party Frock',
      brand: 'Tiny Tots',
      price: 799,
      mrp: 1299,
      icon: Icons.checkroom,
      color: Color(0xFFFFDCEB)),
  Product(
      name: 'Denim Dungaree Set',
      brand: 'Playwear',
      price: 899,
      mrp: 1499,
      icon: Icons.checkroom,
      color: Color(0xFFD6E4F5)),
  Product(
      name: 'Sports Running Shoes',
      brand: 'Stride Jr',
      price: 999,
      mrp: 1799,
      icon: Icons.directions_walk,
      color: Color(0xFFEBDDFB)),
  Product(
      name: 'Soft Plush Teddy',
      brand: 'Cuddle Co',
      price: 499,
      mrp: 799,
      icon: Icons.toys,
      color: Color(0xFFFFF1C9)),
  Product(
      name: 'Ethnic Kurta Set',
      brand: 'Festive Fun',
      price: 1099,
      mrp: 1899,
      icon: Icons.checkroom,
      color: Color(0xFFFFE3D6)),
];

const List<Product> newArrivals = [
  Product(
      name: 'Striped Night Suit',
      brand: 'Dream Time',
      price: 449,
      mrp: 799,
      icon: Icons.bedtime_outlined,
      color: Color(0xFFE3E7FF)),
  Product(
      name: 'Baby Romper Pack of 3',
      brand: 'Little Kicks',
      price: 599,
      mrp: 999,
      icon: Icons.child_friendly,
      color: Color(0xFFFFF1C9)),
  Product(
      name: 'Kids Backpack',
      brand: 'School Gear',
      price: 699,
      mrp: 1199,
      icon: Icons.backpack_outlined,
      color: Color(0xFFDDF5E3)),
  Product(
      name: 'Hair Accessories Set',
      brand: 'Tiny Tots',
      price: 249,
      mrp: 449,
      icon: Icons.auto_awesome,
      color: Color(0xFFFFDCEB)),
  Product(
      name: 'Building Blocks 100 pcs',
      brand: 'Brainy Play',
      price: 649,
      mrp: 999,
      icon: Icons.extension,
      color: Color(0xFFDCEBFF)),
  Product(
      name: 'Winter Hoodie',
      brand: 'Playwear',
      price: 849,
      mrp: 1499,
      icon: Icons.checkroom,
      color: Color(0xFFEBDDFB)),
];
