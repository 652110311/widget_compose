import 'package:flutter/material.dart';
import 'package:widget_compose/entities/product.dart';
import 'package:widget_compose/widgets/elements/buttons/primary_button.dart';
import 'package:widget_compose/widgets/elements/texts/big_text.dart';
import 'package:widget_compose/widgets/elements/texts/price_text.dart';
import 'package:widget_compose/widgets/elements/texts/small_text.dart';
import 'package:widget_compose/widgets/elements/texts/text_title.dart';

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
            child: SizedBox(
              height: 700,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SmallText(title: widget.product.category),
                              TextTitle(
                                title: widget.product.name,
                                color: Colors.black,
                              ),
                              PriceText(
                                  price: '\$${widget.product.price.toString()}',
                                  color: Colors.black)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.network(
                      widget.product.imageUrl,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                        SmallText(title: widget.product.description.toString()),
                  ),
                  const PrimaryButton(title: 'Add to cart')
                ],
              ),
            ),
          ),
        ));
  }
}
