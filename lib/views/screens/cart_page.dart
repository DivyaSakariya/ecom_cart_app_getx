import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../modals/api_modal.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});

  CartController cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: cartController.cartItems.isEmpty
            ? const Center(
                child: Column(
                  children: [
                    Text("Not Added Any Product Yet"),
                  ],
                ),
              )
            : Obx(() {
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartController.cartItems.length,
                        itemBuilder: (context, index) {
                          ProductModal products =
                              cartController.cartItems[index];
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                foregroundImage: NetworkImage(
                                  products.thumbnail,
                                ),
                              ),
                              title: Text(products.title),
                              subtitle: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      cartController.changeQty(
                                          value: 1, index: index);
                                      cartController.amountUpdate(
                                          value: products.price);
                                    },
                                    child: const Text("+"),
                                  ),
                                  Obx(
                                    () {
                                      return Text(
                                          "${cartController.cartItems[index].qty}");
                                    },
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      cartController.changeQty(
                                          value: -1, index: index);
                                      cartController.amountUpdate(
                                          value: -products.price);
                                    },
                                    child: const Text("-"),
                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  cartController.removeProduct(
                                      products: products);

                                  cartController.amountUpdate(
                                      value: -(products.price));
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      "Amount:- ${cartController.totalAmount}",
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ],
                );
              }),
      ),
    );
  }
}
