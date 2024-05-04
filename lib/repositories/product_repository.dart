import 'package:widget_compose/models/Product.dart';
import 'package:widget_compose/network/http/http_service.dart';
import 'package:widget_compose/port/product.dart';

class ProductRepository implements IProductRepository {

  final HttpService httpService;

  ProductRepository(this.httpService);

  @override
  Future<List<Product>> getByCategory(String category) async {
    final response = await httpService.get('/products/category/$category');
    List<Product> products = [];
    for(dynamic res in response) {
      products.add(Product.fromJson(res));
    }
    return products;
  }

}