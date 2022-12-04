import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/modules/dashboard_modules/product_page/modal/product_modal.dart';
import 'package:task/modules/dashboard_modules/product_page/service/product_service.dart';

class ProductController extends GetxController {
  Rx<ProductModal> productModal = ProductModal().obs;
  RxBool isLoading = false.obs;
  RxList<Product> productList = <Product>[].obs;
  int select = 1;
  ScrollController scrollController = ScrollController();
  RxString product = "10".obs;

  @override
  void onInit() {
    productDetail(1);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        nextProductDetail();
      }
    });
    super.onInit();
  }

  Future productDetail(int select) async {
    try {
      isLoading.value = true;
      productModal.value = await ProductService.getProductData(1);
      productList.addAll(productModal.value.data?.products ?? []);
      product.value = productList.length.toString();
    } catch (e, st) {
      log("loginError-------------$e--------------$st");
    } finally {
      isLoading.value = false;
    }
  }

  Future nextProductDetail() async {
    try {
      select++;

      productModal.value = await ProductService.getProductData(select);
      if (productModal.value.data?.products != null) {
        productList.addAll(productModal.value.data?.products ?? []);
        product.value = productList.length.toString();
      }
    } catch (e, st) {
      log("loginError-------------$e--------------$st");
    } finally {}
  }
}
