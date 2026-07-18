import 'package:ecom_app/data/products.repository.dart';
import 'package:ecom_app/domain/product.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final allProductsProvider = Provider<List<Product>>((ref) {
  return ref.watch(productsRepositoryProvider).getAllProducts();
});
