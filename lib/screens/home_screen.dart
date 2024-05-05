import 'package:flutter/material.dart';
import 'package:widget_compose/di/get_it.dart';
import 'package:widget_compose/entities/product.dart';
import 'package:widget_compose/mocks/products.dart';
import 'package:widget_compose/port/product.dart';
import 'package:widget_compose/widgets/compounds/jumbotron/home_jumbotron.dart';
import 'package:widget_compose/widgets/compounds/navbar/home_nav.dart';
import 'package:widget_compose/widgets/compounds/sections/catalog.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final IProductService service = getIt.get<IProductService>();
  
  List<List<ProductToDisplay>> products = [];
  List<String> categories = [];

  _HomePageState() {
    getProducts();
  }

  void getProducts() async {
    final categories = await service.getCategories();
    final productFetchers = categories.map((e) => service.getByCategory(e));
    final products = await Future.wait(productFetchers);


    setState(() {
      this.products = products;
      this.categories = categories;
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
              child: ListView.builder( 
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      HomeJumbotron(
                      imageUrl: categoryImages[categories[index]]!, 
                      title: categories[index].toUpperCase(), 
                      buttonTitle:'View collection'),
                      Catalog(products: products[index], title: 'All Product'),
                      const SizedBox(height: 24,)
                    ],
                  );
              },
                    ), 
              )

            ],
          ),
        ),
    );
  }
}

