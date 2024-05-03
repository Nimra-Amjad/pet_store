import 'package:get/get.dart';

class CartController extends GetxController {
  var product = 0.obs;

  increment() {
    product.value++;
  }

  decrement() {
    if (product.value <= 0) {
      // Get.snackbar("Buying Books", "Cannot be less than zero",
      //     icon: Icon(Icons.alarm),
      //     barBlur: 20,
      //     isDismissible: true,
      //     duration: Duration(seconds: 3));
    } else {
      product.value--;
    }
  }

  void reset() {
    product.value = 0;
  }
}
