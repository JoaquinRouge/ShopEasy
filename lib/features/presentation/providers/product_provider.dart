import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_easy/features/datasources/product_datasource.dart';
import 'package:shop_easy/features/entitites/product.dart';
import 'package:shop_easy/features/repositories/product/product_repository.dart';
import 'package:shop_easy/features/usecases/product/get_products_usecase.dart';

final productDatasourceProvider = Provider((ref) => ProductDatasource());

final productRepositoryProvider = Provider(
  (ref) => ProductRepository(ref.read(productDatasourceProvider)),
);

final productUseCaseProvider = Provider(
  (ref) => GetProductsUsecase(ref.read(productRepositoryProvider)),
);

final productProvider = FutureProvider<List<Product>>((ref) async {
  final useCase = ref.read(productUseCaseProvider);

  return await useCase();
});
