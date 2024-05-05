import 'package:flutter/material.dart';
import 'package:widget_compose/entities/product.dart';
import 'package:widget_compose/widgets/elements/texts/price_text.dart';
import 'package:widget_compose/widgets/elements/texts/small_text.dart';

typedef ProductCardTap = Function(ProductToDisplay product);
class ProductCard extends StatelessWidget {
  final ProductToDisplay product;
  final ProductCardTap? onTap;

  const ProductCard({super.key, required this.product,this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(onTap != null) {
          onTap!(product);
        }
      },
      child: SizedBox(
        width: 200,
        height: 240,
        child: Stack(
          children: [
          Image.network(product.imageUrl,width: 200, fit: BoxFit.cover,),
          Column(
            children: [
              const Spacer(),
              Container(
                color: const Color(0x88000000),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmallText(title: product.name, color: Colors.white,),
                      PriceText(price: '${product.price}\$'),
                    ],
                  ),
                ),
              )
            ],
          )
        ],),
      ),
    );
  }

}