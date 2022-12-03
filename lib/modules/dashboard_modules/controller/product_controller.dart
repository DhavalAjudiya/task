import 'dart:developer';

import 'package:get/get.dart';
import 'package:task/modules/dashboard_modules/modal/product_modal.dart';
import 'package:task/modules/dashboard_modules/service/product_service.dart';

class ProductController extends GetxController {
  Rx<ProductModal> productModal = ProductModal().obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    productDetail();
    super.onInit();
  }

  Future productDetail() async {
    try {
      isLoading.value = true;
      productModal.value = await ProductService.getProductData();
      log("productModal.value------- 1: ${productModal.value.toJson()}");
      log("productModal.value------- 2: ${productModal.value.data?.toJson()}");
    } catch (e, st) {
      log("loginError-------------$e--------------$st");
    } finally {
      isLoading.value = false;
    }
  }
}
