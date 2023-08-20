import 'package:get/get.dart';

import '../modals/api_modal.dart';

class CartController extends GetxController {
  RxList<ProductModal> cartItems = <ProductModal>[].obs;
  RxInt totalAmount = 0.obs;

  addToCart({required ProductModal products}) {
    cartItems.add(products);
  }

  removeProduct({required ProductModal products}) {
    cartItems.remove(products);
  }

  changeQty({required int value, required int index}) {
    cartItems[index].qty += value;
    if (cartItems[index].qty < 1) {
      cartItems.removeAt(index);
      cartItems[index].qty = 1 as RxInt;
    }
    update();
  }

  amountUpdate({required int value}) {
    totalAmount += value;
  }
}
