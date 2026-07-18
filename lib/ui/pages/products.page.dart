import 'package:ecom_app/application/products.providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(searchProductsProvider);
    final keyword = ref.watch(searchKeyWordStateProvider);
    TextEditingController searchProductsController = TextEditingController(
      text: keyword,
    );
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: searchProductsController,
                      decoration: InputDecoration(
                        hintText: "Product name search",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      String kw = searchProductsController.text;
                      ref.read(searchKeyWordStateProvider.notifier).state = kw;
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                  title: Card.outlined(
                    child: IntrinsicHeight(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(allProducts[index].photo, width: 150),
                            VerticalDivider(width: 1),
                            Column(
                              children: [
                                Text("${allProducts[index].id}"),
                                Text("${allProducts[index].name} MAD"),
                                Text("${allProducts[index].price} Units"),
                                TextButton(
                                  onPressed: () {},
                                  child: Text("Add To Card"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: allProducts.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
