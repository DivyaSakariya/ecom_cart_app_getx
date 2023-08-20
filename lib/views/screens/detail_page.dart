import 'package:ecom_cart_app_getx/controllers/cart_controller.dart';
import 'package:ecom_cart_app_getx/modals/api_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    dynamic products = ModalRoute.of(context)!.settings.arguments;

    TextStyle titleStyle =
        const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);
    TextStyle textStyle = const TextStyle(fontSize: 12);
    TextStyle priceStyle = const TextStyle(fontSize: 14);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail: ${products.title}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                height: 200,
                child: Image.network("${products.thumbnail}"),
              ),
              const SizedBox(height: 20),
              Text(
                "${products.title}",
                style: titleStyle,
              ),
              const Divider(),
              Text(
                "Category :- ${products.category}",
                style: textStyle,
              ),
              const Divider(),
              Text(
                "Brand :- ${products.brand}",
                style: textStyle,
              ),
              const Divider(),
              Text(
                "Description :- ${products.description}",
                style: textStyle,
              ),
              const Divider(),
              Text(
                "Price :- 💲 ${products.price}",
                style: priceStyle,
              ),
              const Divider(),
              Text(
                "Discount :- ${products.discountPercentage} %",
                style: priceStyle,
              ),
              const Divider(),
              Text(
                "Rating :- ${products.rating}",
                style: priceStyle,
              ),
              const Divider(),
              Text(
                "Stock :- ${products.stock}",
                style: priceStyle,
              ),
              const Divider(),
              const SizedBox(height: 20),
              Center(
                child: SizedBox(
                  width: 250,
                  child: ElevatedButton(
                    onPressed: () {
                      if (cartController.cartItems.contains(products)) {
                        Get.snackbar(
                          'Already in Cart...!!!',
                          'Product ${products.title}',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      } else {
                        cartController.addToCart(products: products);
                        cartController.amountUpdate(value: products.price);
                        Get.snackbar(
                          'Added Successfully...!!!',
                          'Product ${products.title}',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                      }
                    },
                    child: const Text("ADD CART"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
