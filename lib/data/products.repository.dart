import 'package:ecom_app/domain/product.model.dart';

class ProductsRepository {
  final List<Product> products = [
    Product(
      id: 1,
      name: "Computer-1",
      price: 3200,
      quantity: 2,
      photo: "images/Laptop-computer.webp",
      selected: false,
    ),
    Product(
      id: 1,
      name: "Computer-2",
      price: 1200,
      quantity: 5,
      photo: "images/Laptop-computer.webp",
      selected: false,
    ),
    Product(
      id: 1,
      name: "Computer-3",
      price: 200,
      quantity: 90,
      photo: "images/Laptop-computer.webp",
      selected: false,
    ),
  ];

  List<Product> getAllProducts() {
    return products;
  }

  List<Product> searchProducts(String keyword) {
    final result = products
        .where((p) => p.name.toLowerCase().contains(keyword.toLowerCase()))
        .toList();
    return result;
  }
}
