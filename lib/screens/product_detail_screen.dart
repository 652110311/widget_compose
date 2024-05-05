import 'package:flutter/material.dart';
import 'package:widget_compose/entities/product.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductToDisplay product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Product Detail')),
        body: SafeArea(
          child: Expanded(
            child: Center(child: Text(widget.product.name)),
          ),
        ));
  }
}
