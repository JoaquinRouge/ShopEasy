import 'package:shop_easy/features/entitites/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getProducts();
}
