import 'package:widget_compose/entities/product.dart';
import 'package:widget_compose/models/Product.dart';
import 'package:widget_compose/network/http/http_service.dart';
import 'package:widget_compose/port/product.dart';

final List<ProductToDisplay> products =[
  ProductToDisplay(id: 'prod-01', category: 'xxx', imageUrl: 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?q=80&w=2187&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', name: 'Nike Air Force 1', price: 399),
  ProductToDisplay(id: 'prod-02', category: 'xxx', imageUrl: 'https://images.unsplash.com/photo-1576566588028-4147f3842f27?q=80&w=2400&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', name: 'Cool Cat T-Shirt', price: 199),
  ProductToDisplay(id: 'prod-03', category: 'xxx', imageUrl: 'https://images.unsplash.com/photo-1617019114583-affb34d1b3cd?q=80&w=3774&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D', name: 'Nice Dress', price: 299),
];

// class MockProductRepository implements ProductRepository {

//   final HttpService httpService;

//   MockProductRepository(this.httpService);

//   @override
//   Future<List<Product>> getByCategory(String category) async {
//     final response = await httpService.get(category);
//     List<Product> products = [];
//     for(dynamic res in response) {
//       products.add(Product.fromJson(res));
//     }
//     return products;
//   }

// }