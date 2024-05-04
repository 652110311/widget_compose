import 'package:flutter/material.dart';
import 'package:widget_compose/entities/product.dart';
import 'package:widget_compose/mocks/products.dart';
import 'package:widget_compose/network/http/dio_service.dart';
import 'package:widget_compose/port/product.dart';
import 'package:widget_compose/repositories/product_repository.dart';
import 'package:widget_compose/services/product_service.dart';
import 'package:widget_compose/widgets/compounds/cards/product_card.dart';
import 'package:widget_compose/widgets/compounds/jumbotron/home_jumbotron.dart';
import 'package:widget_compose/widgets/compounds/list/product_list.dart';
import 'package:widget_compose/widgets/compounds/navbar/home_nav.dart';
import 'package:widget_compose/widgets/compounds/sections/catalog.dart';
import 'package:widget_compose/widgets/elements/inputs/search_input.dart';
import 'package:widget_compose/mocks/products.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final IProductService service;

  List<ProductToDisplay> products = [];

  _HomePageState() {
    final http = DioService('https://fakestoreapi.com');
    final repo = ProductRepository(http);
    service = ProductService(repo);

    getProducts();
  }

  void getProducts() async {
    final products = await service.getByCategory('electronics');
    setState(() {
      this.products = products;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const HomeNavbar(),
              Expanded(
              child: ListView(
              children: [
                const HomeJumbotron(
                  imageUrl: 'https://media.istockphoto.com/id/1476623247/th/%E0%B8%A3%E0%B8%B9%E0%B8%9B%E0%B8%96%E0%B9%88%E0%B8%B2%E0%B8%A2/%E0%B8%9C%E0%B8%B9%E0%B9%89%E0%B8%AB%E0%B8%8D%E0%B8%B4%E0%B8%87%E0%B8%A1%E0%B8%B5%E0%B8%84%E0%B8%A7%E0%B8%B2%E0%B8%A1%E0%B8%AA%E0%B8%B8%E0%B8%82%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B8%96%E0%B8%B8%E0%B8%87%E0%B8%8A%E0%B9%89%E0%B8%AD%E0%B8%9B%E0%B8%9B%E0%B8%B4%E0%B9%89%E0%B8%87%E0%B9%80%E0%B8%9E%E0%B8%A5%E0%B8%B4%E0%B8%94%E0%B9%80%E0%B8%9E%E0%B8%A5%E0%B8%B4%E0%B8%99%E0%B8%81%E0%B8%B1%E0%B8%9A%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%8A%E0%B9%89%E0%B8%AD%E0%B8%9B%E0%B8%9B%E0%B8%B4%E0%B9%89%E0%B8%87.jpg?s=1024x1024&w=is&k=20&c=B4L_8OpiSmygoJf59WAt5Hr9iAFMmuBs2cMk_JFqD8I=', 
                title: 'OUTERWEAR', buttonTitle: 'View Collection',),
                Catalog(products: products, title: 'Most Popular Outerwear'),
                const SizedBox(height: 24,),
                const HomeJumbotron(
                imageUrl: 'https://images.unsplash.com/photo-1568605117036-5fe5e7bab0b7?q=80&w=2340&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', 
                title: 'Auto Cars', buttonTitle: 'View Collection',),
                Catalog(products: products, title: 'Most Popular Auto Cars'),
              ],
                    ), 
              )

            ],
          ),
        ),
    );
  }
}

