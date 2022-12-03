import 'package:get/get.dart';
import 'package:task/modules/dashboard_modules/controller/product_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProductController>(ProductController());
  }
}
