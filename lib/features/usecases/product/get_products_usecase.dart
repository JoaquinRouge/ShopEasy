import 'package:shop_easy/features/entitites/product.dart';
import 'package:shop_easy/features/repositories/product/i_product_repository.dart';

class GetProductsUsecase {
  final IProductRepository repository;

  GetProductsUsecase(this.repository);

  Future<List<Product>> call() async {
    return await repository.getProducts();
  }
}
