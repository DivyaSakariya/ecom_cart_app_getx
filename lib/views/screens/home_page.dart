import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../helpers/api_helper.dart';
import '../../modals/api_modal.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecommerce App"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () => Get.toNamed('/cart_page'),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Obx(
                  () => Text("${cartController.cartItems.length}"),
                ),
                const Center(
                  child: Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: FutureBuilder(
          future: ApiHelper.apiHelper.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  ProductModal products = snapshot.data![index];
                  return GestureDetector(
                    onTap: () => Get.toNamed('/detail_page',arguments: products),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          foregroundImage: NetworkImage(
                            products.thumbnail,
                          ),
                        ),
                        title: Text(products.title),
                        subtitle: Text("Price: ${products.price}"),
                        trailing: IconButton(
                          onPressed: () {
                            if (cartController.cartItems.contains(products)) {
                              Get.snackbar(
                                'Already in Cart...!!!',
                                'Product ${products.title}',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            } else {
                              cartController.addToCart(products: products);
                              cartController.amountUpdate(
                                  value: products.price);
                              Get.snackbar(
                                'Added Successfully...!!!',
                                'Product ${products.title}',
                                snackPosition: SnackPosition.BOTTOM,
                              );
                            }
                          },
                          icon: const Icon(Icons.add_shopping_cart_rounded),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("${snapshot.error}"),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
