import 'package:flutter/material.dart';
import 'package:shop_easy/features/entitites/product.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({super.key,required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
