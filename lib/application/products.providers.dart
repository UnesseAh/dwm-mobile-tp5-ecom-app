import 'package:ecom_app/data/products.repository.dart';
import 'package:ecom_app/domain/product.model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final allProductsProvider = Provider<List<Product>>((ref) {
  return ref.watch(productsRepositoryProvider).getAllProducts();
});

final searchKeyWordStateProvider = StateProvider<String>((ref) {
  return "";
});

final searchProductsProvider = Provider<List<Product>>((ref) {
  String keyword = ref.watch(searchKeyWordStateProvider);
  return ref.watch(productsRepositoryProvider).searchProducts(keyword);
});
