import 'package:shop_easy/features/datasources/product_datasource.dart';
import 'package:shop_easy/features/entitites/product.dart';
import 'package:shop_easy/features/repositories/product/i_product_repository.dart';

class ProductRepository implements IProductRepository {
  final ProductDatasource productDatasource;

  ProductRepository(this.productDatasource);

  @override
  Future<List<Product>> getProducts() async {
    return await productDatasource.fetchProducts();
  }
}
