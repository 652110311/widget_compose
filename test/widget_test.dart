import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:widget_compose/mocks/mock_http_service.dart';
import 'package:widget_compose/network/http/http_service.dart';
import 'package:widget_compose/port/product.dart';
import 'package:widget_compose/repositories/product_repository.dart';
import 'package:widget_compose/services/product_service.dart';

void main() {
  final getIt = GetIt.instance;

  getIt.registerSingleton<HttpService>(MockHttpService('mock'));
  getIt.registerSingleton<IProductRepository>(ProductRepository());
  getIt.registerSingleton<IProductService>(ProductService());
  test('Get product by electronics category returns electronics products',
      () async {
    final mockHttpService = getIt.get<HttpService>();
    (mockHttpService as MockHttpService).returnData = [
      {
        "id": 9,
        "title": "WD 2TB Elements Portable External Hard Drive - USB 3.0 ",
        "price": 64,
        "description":
            "USB 3.0 and USB 2.0 Compatibility Fast data transfers Improve PC Performance High Capacity; Compatibility Formatted NTFS for Windows 10, Windows 8.1, Windows 7; Reformatting may be required for other operating systems; Compatibility may vary depending on user’s hardware configuration and operating system",
        "category": "electronics",
        "image": "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
        "rating": {"rate": 3.3, "count": 203}
      }
    ];

    final productService = getIt.get<IProductService>();
    final products = await productService.getByCategory('electronics');

    expect(products, isNotEmpty);
    expect(products[0].category, 'electronics');
  });

  test('get all categories', () async {
    final mockHttpService = getIt.get<HttpService>();
    (mockHttpService as MockHttpService).returnData = [
      "electronics",
      "jewelery",
      "men's clothing",
      "women's clothing"
    ];

    final productService = getIt.get<IProductService>();
    final categories = await productService.getCategories();

    expect(categories, isNotEmpty);
    expect(categories[0], 'electronics');
  });
}
